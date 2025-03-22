import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:googleapis/sheets/v4.dart' as sheets;
import 'package:googleapis/docs/v1.dart' as docs;
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:http/http.dart' as http;
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';

class GoogleImporter extends StatefulWidget {
  const GoogleImporter({super.key});

  @override
  GoogleImporterState createState() => GoogleImporterState();
}

class GoogleImporterState extends State<GoogleImporter> {
  bool isAuthenticated = false;
  bool isLoading = false;
  http.Client? _client;
  List<DriveFile> documentsList = [];
  List<DriveFile> spreadsheetsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Importador de Google Docs/Sheets')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : !isAuthenticated
                ? Center(
                    child: ElevatedButton(
                      onPressed: _authenticate,
                      child: const Text('Iniciar sesión con Google'),
                    ),
                  )
                : DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        const TabBar(
                          tabs: [
                            Tab(text: 'Google Docs'),
                            Tab(text: 'Google Sheets'),
                          ],
                          labelColor: Colors.blue,
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              // Tab de Google Docs
                              _buildDocumentsList(),
                              // Tab de Google Sheets
                              _buildSpreadsheetsList(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }

  List<Map<String, dynamic>> _extractUnitsFromDocContent(String content) {
    List<Map<String, dynamic>> units = [];

    // Expresión regular para encontrar unidades completas con todo su contenido
    final RegExp unitPattern = RegExp(
        r'===INICIO_UNIDAD_(\d+)===\s*TÍTULO:\s*([^\n]+)\s*CONTENIDO:\s*(.*?)===FIN_UNIDAD_\1===',
        multiLine: true,
        dotAll: true // Permite que el punto coincida con saltos de línea
        );

    // Encontrar todas las unidades
    final matches = unitPattern.allMatches(content);

    // Procesar cada unidad
    for (var match in matches) {
      final unitNumber = int.parse(match.group(1) ?? '0');
      final unitTitle = match.group(2)?.trim() ?? 'Unidad $unitNumber';
      final unitContent = match.group(3)?.trim() ?? '';

      // Añadir la unidad solo si tiene contenido
      if (unitContent.isNotEmpty) {
        units.add({
          'id': 'unit_$unitNumber',
          'title': unitTitle,
          'content': unitContent,
          'order': unitNumber,
        });
      }
    }

    return units;
  }

  Widget _buildDocumentsList() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _fetchDocuments,
          child: const Text('Actualizar lista de documentos'),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: documentsList.isEmpty
              ? const Center(child: Text('No hay documentos disponibles'))
              : ListView.builder(
                  itemCount: documentsList.length,
                  itemBuilder: (context, index) {
                    final doc = documentsList[index];
                    return ListTile(
                      title: Text(doc.name),
                      subtitle:
                          Text('Última modificación: ${doc.modifiedTime}'),
                      onTap: () => _importGoogleDoc(doc.id),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildSpreadsheetsList() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _fetchSpreadsheets,
          child: const Text('Actualizar lista de hojas de cálculo'),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: spreadsheetsList.isEmpty
              ? const Center(child: Text('No hay hojas disponibles'))
              : ListView.builder(
                  itemCount: spreadsheetsList.length,
                  itemBuilder: (context, index) {
                    final sheet = spreadsheetsList[index];
                    return ListTile(
                      title: Text(sheet.name),
                      subtitle:
                          Text('Última modificación: ${sheet.modifiedTime}'),
                      onTap: () => _importGoogleSheet(sheet.id),
                    );
                  },
                ),
        ),
      ],
    );
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        "143135305604-kqsqfsvufcaa4o1d1pekh86g1uet3l0s.apps.googleusercontent.com", // Agregar esta línea
    scopes: [
      'https://www.googleapis.com/auth/documents.readonly',
      'https://www.googleapis.com/auth/spreadsheets.readonly',
      'https://www.googleapis.com/auth/drive.readonly',
    ],
  );

  Future<void> _authenticate() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Iniciar sesión
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        // Convertir autenticación a un cliente HTTP para googleapis
        _client = await _googleSignIn.authenticatedClient();

        if (_client != null) {
          setState(() {
            isAuthenticated = true;
            isLoading = false;
          });

          // Obtener documentos y hojas después de autenticación
          await _fetchDocuments();
          await _fetchSpreadsheets();
        } else {
          throw Exception('No se pudo obtener un cliente autenticado');
        }
      } else {
        throw Exception('Inicio de sesión cancelado');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error de autenticación: $e');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al autenticar: $e')),
      );
    }
  }

  Future<void> _fetchDocuments() async {
    if (_client == null) return;

    setState(() {
      isLoading = true;
    });

    try {
      final driveApi = drive.DriveApi(_client!);

      // Versión simplificada sin parámetros problemáticos
      final response = await driveApi.files.list(
        q: "mimeType='application/vnd.google-apps.document' and trashed=false",
        orderBy: "modifiedTime desc",
      );

      setState(() {
        documentsList = (response.files ?? [])
            .map((file) => DriveFile(
                  id: file.id ?? '',
                  name: file.name ?? 'Sin nombre',
                  modifiedTime: file.modifiedTime?.toLocal().toString() ?? '',
                ))
            .toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error al obtener documentos: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al obtener documentos: $e')),
      );
    }
  }

  Future<void> _fetchSpreadsheets() async {
    if (_client == null) return;

    setState(() {
      isLoading = true;
    });

    try {
      final driveApi = drive.DriveApi(_client!);

      // Versión simplificada sin parámetros problemáticos
      final response = await driveApi.files.list(
        q: "mimeType='application/vnd.google-apps.spreadsheet' and trashed=false",
        orderBy: "modifiedTime desc",
      );

      setState(() {
        spreadsheetsList = (response.files ?? [])
            .map((file) => DriveFile(
                  id: file.id ?? '',
                  name: file.name ?? 'Sin nombre',
                  modifiedTime: file.modifiedTime?.toLocal().toString() ?? '',
                ))
            .toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error al obtener hojas de cálculo: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al obtener hojas de cálculo: $e')),
      );
    }
  }

  Future<void> _importGoogleSheet(String spreadsheetId) async {
    if (_client == null) return;
    setState(() {
      isLoading = true;
    });

    try {
      final sheetsApi = sheets.SheetsApi(_client!);
      final spreadsheet = await sheetsApi.spreadsheets.get(spreadsheetId);
      final title = spreadsheet.properties!.title ?? 'Sin título';

      // Solicitar información del curso
      final courseInfo = await _requestCourseInfo(context, title);
      if (courseInfo == null) {
        // El usuario canceló la importación
        setState(() {
          isLoading = false;
        });
        return;
      }

      // Mostrar diálogo de progreso
      // ignore: use_build_context_synchronously
      _showImportProgressDialog(context, 'Hoja de cálculo', title);

      // Obtener ID del curso
      String courseId = courseInfo['courseId'] ?? '';
      if (courseId.isEmpty) {
        // Crear un nuevo curso
        final courseRef =
            FirebaseFirestore.instance.collection('courses').doc();
        courseId = courseRef.id;
        await courseRef.set({
          'title': courseInfo['courseName'] ?? title,
          'description':
              courseInfo['courseDescription'] ?? 'Curso importado desde Google',
          'thumbnailUrl': '',
          'duration': 0,
          'level': courseInfo['courseLevel'] ?? 'beginner',
          'tags': courseInfo['courseTags'] ?? [],
          'isActive': true,
          'imageUrl': '',
          'isEnabled': true,
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
          'passingScore': 70,
          'certificateTemplate': 'template_basic',
          'enrolledStudents': 0,
          'completedStudents': 0
        });
      }

      // Procesar cada hoja como una unidad independiente
      int totalHojas = 0;
      int totalPreguntas = 0;

      for (var sheet in spreadsheet.sheets!) {
        final sheetTitle = sheet.properties!.title ?? 'Hoja sin título';
        final sheetId = sheet.properties!.sheetId.toString();

        // Obtener datos de la hoja
        final range =
            '$sheetTitle!A1:H1000'; // Ajustar según la estructura esperada
        final response =
            await sheetsApi.spreadsheets.values.get(spreadsheetId, range);
        final rows = response.values ?? [];

        if (rows.isEmpty || rows.length < 2) {
          continue; // Omitir hojas vacías o sin suficientes datos
        }

        // Validar que la primera fila contiene los encabezados esperados
        if (!_validateHeaders(rows[0])) {
          // Mostrar error y continuar con la siguiente hoja
          print(
              'Error: La hoja "$sheetTitle" no tiene los encabezados esperados.');
          continue;
        }

        // Crear la unidad en Firestore
        final unitRef = FirebaseFirestore.instance
            .collection('courses')
            .doc(courseId)
            .collection('units')
            .doc();

        await unitRef.set({
          'title': sheetTitle,
          'description': 'Unidad importada desde Google Sheets',
          'order': totalHojas + 1, // Asignar orden secuencial
          'content': 'Contenido generado automáticamente desde Google Sheets',
          'duration': 30, // Duración estimada en minutos
          'isActive': true,
          'hasTest': true,
          'courseId': courseId
        });

        // Procesar las preguntas de la hoja
        int preguntasEnHoja =
            await _processSheetQuestions(rows, courseId, unitRef.id);

        totalHojas++;
        totalPreguntas += preguntasEnHoja;
      }

      // Cerrar diálogo de progreso y finalizar
      Navigator.of(context).pop();
      setState(() {
        isLoading = false;
      });

      // Mostrar mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Se importaron $totalHojas hojas con un total de $totalPreguntas preguntas'),
        ),
      );
    } catch (e) {
      // En caso de error, cerrar el diálogo
      if (Navigator.canPop(context)) {
        Navigator.of(context).pop();
      }
      setState(() {
        isLoading = false;
      });
      print('Error al importar hoja: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al importar hoja: $e')),
      );
    }
  }

// Función para validar los encabezados de la hoja
  bool _validateHeaders(List<dynamic> headers) {
    final expectedHeaders = [
      '#',
      'Pregunta',
      'Opción A',
      'Opción B',
      'Opción C',
      'Opción D',
      'Respuesta Correcta',
      'Retroalimentación'
    ];

    // Verificar si todos los encabezados esperados están presentes
    for (var expected in expectedHeaders) {
      bool found = false;
      for (var header in headers) {
        if (header.toString().trim().toLowerCase() == expected.toLowerCase()) {
          found = true;
          break;
        }
      }
      if (!found) return false;
    }

    return true;
  }

  Future<int> _processSheetQuestions(
      List<List<dynamic>> rows, String courseId, String unitId) async {
    // La primera fila contiene los encabezados
    final headers = rows[0].map((h) => h.toString().trim()).toList();

    // Obtener índices de cada columna
    final numIndex = headers.indexWhere((h) => h.toLowerCase() == '#');
    final questionIndex =
        headers.indexWhere((h) => h.toLowerCase() == 'pregunta');
    final optionAIndex =
        headers.indexWhere((h) => h.toLowerCase() == 'opción a');
    final optionBIndex =
        headers.indexWhere((h) => h.toLowerCase() == 'opción b');
    final optionCIndex =
        headers.indexWhere((h) => h.toLowerCase() == 'opción c');
    final optionDIndex =
        headers.indexWhere((h) => h.toLowerCase() == 'opción d');
    final correctAnswerIndex =
        headers.indexWhere((h) => h.toLowerCase() == 'respuesta correcta');
    final feedbackIndex =
        headers.indexWhere((h) => h.toLowerCase() == 'retroalimentación');

    int importedQuestions = 0;

    // Procesar cada fila de datos (excepto la primera que contiene encabezados)
    for (int i = 1; i < rows.length; i++) {
      final row = rows[i];

      // Verificar que la fila tenga suficientes datos
      if (row.length <= questionIndex ||
          row[questionIndex] == null ||
          row[questionIndex].toString().trim().isEmpty) {
        continue; // Omitir filas vacías o incompletas
      }

      // Extraer datos de la pregunta
      final questionText = row[questionIndex].toString().trim();
      final options = <Map<String, dynamic>>[];

      // Añadir opciones si están disponibles
      if (optionAIndex >= 0 &&
          optionAIndex < row.length &&
          row[optionAIndex] != null) {
        options.add({
          'id': 'optA',
          'text': row[optionAIndex].toString().trim(),
          'isCorrect': correctAnswerIndex >= 0 &&
              correctAnswerIndex < row.length &&
              row[correctAnswerIndex] != null &&
              row[correctAnswerIndex].toString().toLowerCase().contains('a')
        });
      }

      if (optionBIndex >= 0 &&
          optionBIndex < row.length &&
          row[optionBIndex] != null) {
        options.add({
          'id': 'optB',
          'text': row[optionBIndex].toString().trim(),
          'isCorrect': correctAnswerIndex >= 0 &&
              correctAnswerIndex < row.length &&
              row[correctAnswerIndex] != null &&
              row[correctAnswerIndex].toString().toLowerCase().contains('b')
        });
      }

      if (optionCIndex >= 0 &&
          optionCIndex < row.length &&
          row[optionCIndex] != null) {
        options.add({
          'id': 'optC',
          'text': row[optionCIndex].toString().trim(),
          'isCorrect': correctAnswerIndex >= 0 &&
              correctAnswerIndex < row.length &&
              row[correctAnswerIndex] != null &&
              row[correctAnswerIndex].toString().toLowerCase().contains('c')
        });
      }

      if (optionDIndex >= 0 &&
          optionDIndex < row.length &&
          row[optionDIndex] != null) {
        options.add({
          'id': 'optD',
          'text': row[optionDIndex].toString().trim(),
          'isCorrect': correctAnswerIndex >= 0 &&
              correctAnswerIndex < row.length &&
              row[correctAnswerIndex] != null &&
              row[correctAnswerIndex].toString().toLowerCase().contains('d')
        });
      }

      // Verificar que haya al menos dos opciones y una respuesta correcta
      bool hasCorrectAnswer = options.any((opt) => opt['isCorrect'] == true);
      if (options.length < 2 || !hasCorrectAnswer) {
        continue; // Omitir preguntas sin suficientes opciones o sin respuesta correcta
      }

      // Extraer retroalimentación si está disponible
      String explanation = '';
      if (feedbackIndex >= 0 &&
          feedbackIndex < row.length &&
          row[feedbackIndex] != null) {
        explanation = row[feedbackIndex].toString().trim();
      }

      // Crear la pregunta en Firestore
      final questionRef = FirebaseFirestore.instance
          .collection('courses')
          .doc(courseId)
          .collection('units')
          .doc(unitId)
          .collection('questions')
          .doc();

      await questionRef.set({
        'text': questionText,
        'type': 'multiple-choice',
        'points': 10, // Valor predeterminado
        'options': options,
        'explanation': explanation,
        'order': i // Mantener el orden original
      });

      importedQuestions++;
    }

    return importedQuestions;
  }

  // Función para extraer contenido de un documento Google Docs
  void _showImportSuccessDialog(
      BuildContext context, String type, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$type importado: $title'),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Vista previa del contenido:'),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    content.length > 1000
                        ? '${content.substring(0, 1000)}...'
                        : content,
                    style: const TextStyle(fontFamily: 'monospace'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('¿Deseas guardar este contenido en Firestore?'),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              // Aquí implementa la función para guardar en Firestore
              _saveToFirestore(type, title, content);
              Navigator.pop(context);
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }

  // Función para guardar en Firestore

  String _extractDocContent(docs.Document document) {
    final body = document.body;
    if (body == null || body.content == null) return '';

    // Usar un formato intermedio como Markdown
    StringBuffer markdownContent = StringBuffer();

    for (var element in body.content!) {
      if (element.paragraph != null) {
        var paragraph = element.paragraph!;

        // Detectar listas y encabezados
        String prefix = '';
        if (paragraph.bullet != null) {
          prefix = '- '; // Lista con viñetas
        } else if (paragraph.paragraphStyle?.namedStyleType != null) {
          // Detectar encabezados
          String style = paragraph.paragraphStyle!.namedStyleType!;
          if (style == 'HEADING_1') {
            prefix = '# ';
          } else if (style == 'HEADING_2')
            prefix = '## ';
          else if (style == 'HEADING_3') prefix = '### ';
        }

        markdownContent.write(prefix);

        // Procesar el texto con formato
        if (paragraph.elements != null) {
          for (var textElement in paragraph.elements!) {
            if (textElement.textRun != null) {
              var textRun = textElement.textRun!;
              var text = textRun.content ?? '';

              // Aplicar formato
              if (textRun.textStyle != null) {
                if (textRun.textStyle!.bold == true) {
                  text = '**$text**'; // Negrita en Markdown
                }
                if (textRun.textStyle!.italic == true) {
                  text = '*$text*'; // Cursiva en Markdown
                }
                if (textRun.textStyle!.underline == true) {
                  text = '__${text}__'; // Subrayado en Markdown
                }
              }

              markdownContent.write(text);
            }
          }
        }

        markdownContent.writeln(); // Nueva línea después de cada párrafo
      }
    }

    return markdownContent.toString();
  }

  String _formatSheetRows(List<List<dynamic>> rows) {
    if (rows.isEmpty) return 'No hay datos';

    // Convertir a formato JSON para preservar estructura
    List<Map<String, dynamic>> formattedData = [];

    // Extraer encabezados
    List<String> headers = [];
    for (var cell in rows[0]) {
      headers.add(cell.toString().trim());
    }

    // Procesar filas de datos
    for (int i = 1; i < rows.length; i++) {
      Map<String, dynamic> rowData = {};

      // Solo procesar filas que tengan datos
      if (rows[i]
          .any((cell) => cell != null && cell.toString().trim().isNotEmpty)) {
        for (int j = 0; j < headers.length && j < rows[i].length; j++) {
          rowData[headers[j]] = rows[i][j];
        }
        formattedData.add(rowData);
      }
    }

    // Convertir a JSON para visualización y almacenamiento
    return const JsonEncoder.withIndent('  ').convert(formattedData);
  }

  Future<void> _importGoogleDoc(String docId) async {
    if (_client == null) return;

    setState(() {
      isLoading = true;
    });

    try {
      final docsApi = docs.DocsApi(_client!);
      final document = await docsApi.documents.get(docId);

      // Obtener título del documento
      final title = document.title ?? 'Sin título';

      // Extraer el contenido con formato conservado
      String content = _extractDocContent(document);

      // Mostrar diálogo para confirmar guardado
      setState(() {
        isLoading = false;
      });
      _debugExtractedUnits(content);

      _showSaveOptionsDialog(context, 'Documento', title, content);
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error al importar documento: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al importar documento: $e')),
      );
    }
  }

// Función para extraer temas enumerados del contenido del documento

// Función para procesar datos de cuestionarios desde una hoja de cálculo

  void _showSaveOptionsDialog(
      BuildContext context, String type, String title, String content) {
    final TextEditingController materiaController =
        TextEditingController(text: title);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Guardar $type'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nombre de la materia:'),
            TextField(
              controller: materiaController,
              decoration: const InputDecoration(
                hintText: 'Ej: Matemáticas, Español, Ciencias',
              ),
            ),
            const SizedBox(height: 20),
            const Text('Vista previa:'),
            Container(
              height: 200,
              width: double.maxFinite,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(4),
              ),
              child: SingleChildScrollView(
                child: Text(
                  content.length > 500
                      ? '${content.substring(0, 500)}...'
                      : content,
                  style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              final materia = materiaController.text.trim();
              if (materia.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content:
                          Text('El nombre de la materia no puede estar vacío')),
                );
                return;
              }

              // Guardar con el nombre de materia confirmado o modificado
              Navigator.pop(context);
              _saveToFirestore(type, materia, content);
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }

// Y actualiza el método SaveToFirestore
// Versión corregida del método _saveToFirestore
  Future<void> _saveToFirestore(
      String type, String title, String content) async {
    try {
      setState(() {
        isLoading = true;
      });

      // Solicitar información del curso
      final Map<String, dynamic>? courseInfo =
          await _requestCourseInfo(context, title);
      if (courseInfo == null) {
        // El usuario canceló la importación
        setState(() {
          isLoading = false;
        });
        return;
      }

      // Mostrar diálogo de progreso
      // ignore: use_build_context_synchronously
      _showImportProgressDialog(context, type, title);

      // Generar un ID para el curso
      String courseId = courseInfo['courseId'] ?? '';
      if (courseId.isEmpty) {
        // Crear un nuevo curso
        final courseRef =
            FirebaseFirestore.instance.collection('courses').doc();
        courseId = courseRef.id;

        await courseRef.set({
          'title': courseInfo['courseName'] ?? title,
          'description':
              courseInfo['courseDescription'] ?? 'Curso importado desde Google',
          'thumbnailUrl': '',
          'duration': 0, // Se actualizará después
          'level': courseInfo['courseLevel'] ?? 'beginner',
          'tags': courseInfo['courseTags'] ?? [],
          'isActive': true,
          'imageUrl': '',
          'isEnabled': true,
          'createdAt': FieldValue.serverTimestamp(),
          'updatedAt': FieldValue.serverTimestamp(),
          'passingScore': 70,
          'certificateTemplate': 'template_basic',
          'enrolledStudents': 0,
          'completedStudents': 0
        });
      }

      // Procesar según el tipo de contenido
      if (type == 'Documento') {
        // Extraer unidades del documento
        final List<Map<String, dynamic>> units =
            _extractUnitsFromDocContent(content);

        if (units.isEmpty) {
          throw Exception('No se pudieron extraer unidades del documento');
        }

        // Guardar cada unidad individualmente
        int totalDuration = 0;
        for (var unit in units) {
          // Estimar duración basada en la longitud del contenido (1 minuto por cada 500 caracteres)
          int estimatedDuration =
              ((unit['content'].toString().length / 500) * 60).round();
          estimatedDuration =
              max(10, min(estimatedDuration, 120)); // Entre 10 y 120 minutos
          totalDuration += estimatedDuration;

          final unitRef = FirebaseFirestore.instance
              .collection('courses')
              .doc(courseId)
              .collection('units')
              .doc();

          await unitRef.set({
            'title': unit['title'],
            'description': 'Unidad importada desde Google Docs',
            'order': unit['order'],
            'content': unit['content'],
            'duration': estimatedDuration,
            'isActive': true,
            'hasTest': false,
            'courseId': courseId
            // Por defecto no tiene test
          });
        }

        // Actualizar la duración total del curso
        await FirebaseFirestore.instance
            .collection('courses')
            .doc(courseId)
            .update({
          'duration': totalDuration,
          'updatedAt': FieldValue.serverTimestamp()
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Se importaron ${units.length} unidades correctamente al curso')),
        );
      } else if (type == 'Hoja de cálculo') {
        // Solicitar información de la unidad a la que pertenece el test
        final unitInfo = await _requestUnitForTest(context, courseId);
        if (unitInfo == null) {
          // El usuario canceló la selección de unidad
          Navigator.of(context).pop(); // Cerrar diálogo de progreso
          setState(() {
            isLoading = false;
          });
          return;
        }

        // Procesar datos de preguntas desde el contenido JSON
        final List<Map<String, dynamic>> questionsData =
            _parseQuestionData(content);

        if (questionsData.isEmpty) {
          throw Exception(
              'No se pudieron extraer preguntas válidas de la hoja de cálculo');
        }

        // Convertir al formato esperado por Firestore
        final List<Map<String, dynamic>> firestoreQuestions =
            questionsData.asMap().entries.map((entry) {
          final index = entry.key;
          final question = entry.value;

          return {
            'id': 'q${index + 1}',
            'text': question['texto'] ?? '',
            'type': question['tipo'] ?? 'multiple-choice',
            'points': question['puntos'] ?? 10,
            'options': (question['opciones'] as List<Map<String, dynamic>>)
                .asMap()
                .entries
                .map((optEntry) {
              final optIndex = optEntry.key;
              final option = optEntry.value;

              return {
                'id': 'opt${optIndex + 1}',
                'text': option['texto'] ?? '',
                'isCorrect': option['esCorrecta'] ?? false
              };
            }).toList(),
            'explanation': question['explicacion'] ?? ''
          };
        }).toList();

        // Guardar como test en Firestore
        final testRef = FirebaseFirestore.instance
            .collection('courses')
            .doc(courseId)
            .collection('tests')
            .doc();

        await testRef.set({
          'title': title,
          'unitId': unitInfo['unitId'] ?? '',
          'description': 'Test importado desde Google Sheets',
          'timeLimit': 15,
          'passingScore': 70,
          'maxAttempts': 3,
          'isActive': true,
          'shuffleQuestions': true,
          'shuffleOptions': true,
          'showResultsImmediately': true,
          'questions': firestoreQuestions
        });

        // Si se especificó una unidad, actualizar la unidad para indicar que tiene test
        if (unitInfo['unitId'] != null && unitInfo['unitId'].isNotEmpty) {
          await FirebaseFirestore.instance
              .collection('courses')
              .doc(courseId)
              .collection('units')
              .doc(unitInfo['unitId'])
              .update({'hasTest': true});
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Test "$title" importado correctamente con ${firestoreQuestions.length} preguntas')),
        );
      }

      // Cerrar diálogo de progreso y finalizar
      Navigator.of(context).pop();
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      // En caso de error, cerrar el diálogo
      if (Navigator.canPop(context)) {
        Navigator.of(context).pop();
      }

      setState(() {
        isLoading = false;
      });

      print('Error al guardar en Firestore: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar: $e')),
      );
    }
  }

  Future<Map<String, dynamic>?> _requestCourseInfo(
      BuildContext context, String docTitle) async {
    // Controladores para los campos del formulario
    final TextEditingController courseNameController =
        TextEditingController(text: docTitle);
    final TextEditingController courseDescController =
        TextEditingController(text: 'Curso importado desde Google Docs');

    // Valores para los dropdown
    String? selectedCourseId;
    String selectedLevel = 'beginner';

    // Lista para almacenar cursos
    List<DropdownMenuItem<String>> courseItems = [];

    // Cargar cursos existentes
    await FirebaseFirestore.instance
        .collection('courses')
        .get()
        .then((snapshot) {
      courseItems = snapshot.docs.map((doc) {
        return DropdownMenuItem<String>(
          value: doc.id,
          child: Text(doc.data()['title'] ?? 'Sin título'),
        );
      }).toList();

      // Añadir opción para nuevo curso
      courseItems.insert(
          0,
          const DropdownMenuItem<String>(
            value: '',
            child: Text('-- Crear nuevo curso --'),
          ));
    });

    // Mostrar diálogo
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        bool isNewCourse = true;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Configurar curso'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Selección o creación de curso
                    const Text('Seleccionar curso existente o crear nuevo:'),
                    DropdownButton<String>(
                      isExpanded: true,
                      value: selectedCourseId,
                      hint: const Text('Seleccionar o crear curso'),
                      items: courseItems,
                      onChanged: (value) {
                        setState(() {
                          selectedCourseId = value;
                          isNewCourse = value == null || value.isEmpty;
                        });
                      },
                    ),

                    // Campos para nuevo curso
                    if (isNewCourse) ...[
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: courseNameController,
                        decoration: const InputDecoration(
                          labelText: 'Nombre del nuevo curso',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: courseDescController,
                        decoration: const InputDecoration(
                          labelText: 'Descripción del curso',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 10),
                      const Text('Nivel del curso:'),
                      DropdownButton<String>(
                        value: selectedLevel,
                        items: const [
                          DropdownMenuItem(
                              value: 'beginner', child: Text('Principiante')),
                          DropdownMenuItem(
                              value: 'intermediate', child: Text('Intermedio')),
                          DropdownMenuItem(
                              value: 'advanced', child: Text('Avanzado')),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedLevel = value ?? 'beginner';
                          });
                        },
                      ),
                    ],
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validar campos si es un curso nuevo
                    if (isNewCourse &&
                        courseNameController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Ingresa un nombre para el curso')),
                      );
                      return;
                    }

                    // Crear mapa con la información
                    final Map<String, dynamic> info = {
                      'courseId': selectedCourseId ?? '',
                      'isNewCourse': isNewCourse,
                    };

                    if (isNewCourse) {
                      info['courseName'] = courseNameController.text.trim();
                      info['courseDescription'] =
                          courseDescController.text.trim();
                      info['courseLevel'] = selectedLevel;
                      info['courseTags'] = [selectedLevel];
                    }

                    Navigator.pop(context, info);
                  },
                  child: const Text('Continuar'),
                ),
              ],
            );
          },
        );
      },
    );

    return result;
  }

  Future<Map<String, dynamic>?> _requestUnitForTest(
      BuildContext context, String courseId) async {
    String? selectedUnitId;
    List<DropdownMenuItem<String>> unitItems = [];

    // Cargar unidades del curso
    await FirebaseFirestore.instance
        .collection('courses')
        .doc(courseId)
        .collection('units')
        .orderBy('order')
        .get()
        .then((snapshot) {
      unitItems = snapshot.docs.map((doc) {
        final Map<String, dynamic> data = doc.data();
        return DropdownMenuItem<String>(
          value: doc.id,
          child:
              Text('${data['order'] ?? ''}: ${data['title'] ?? 'Sin título'}'),
        );
      }).toList();

      // Añadir opción para no asociar a ninguna unidad
      unitItems.insert(
          0,
          const DropdownMenuItem<String>(
            value: '',
            child: Text('-- Sin asociar a unidad --'),
          ));
    });

    // Mostrar diálogo para seleccionar unidad
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Seleccionar unidad para el test'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Selecciona la unidad a la que pertenece este test:'),
              const SizedBox(height: 10),
              if (unitItems.isEmpty)
                const Text(
                    'No hay unidades disponibles en este curso. Debes crear primero las unidades.')
              else
                DropdownButton<String>(
                  isExpanded: true,
                  value: selectedUnitId,
                  hint: const Text('Seleccionar unidad'),
                  items: unitItems,
                  onChanged: (value) {
                    selectedUnitId = value;
                    (context as Element).markNeedsBuild();
                  },
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'unitId': selectedUnitId ?? '',
                });
              },
              child: const Text('Continuar'),
            ),
          ],
        );
      },
    );

    return result;
  }

  void _showImportProgressDialog(
      BuildContext context, String type, String title) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('Importando $type'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Importando "$title"...'),
            const SizedBox(height: 20),
            const LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _parseQuestionData(String jsonContent) {
    List<Map<String, dynamic>> preguntas = [];

    try {
      // Parsear el JSON
      final List<dynamic> data = jsonDecode(jsonContent);

      for (var item in data) {
        if (item is Map<String, dynamic>) {
          // Intentar extraer datos con varios formatos posibles
          String preguntaTexto = '';
          String tipo = 'multiple-choice';
          int puntos = 10;
          List<Map<String, dynamic>> opciones = [];
          String explicacion = '';

          // Extraer la pregunta (buscar en diferentes posibles campos)
          for (String campo in [
            'Pregunta',
            'pregunta',
            'Enunciado',
            'enunciado',
            'question',
            'text'
          ]) {
            if (item.containsKey(campo) &&
                item[campo] != null &&
                item[campo].toString().trim().isNotEmpty) {
              preguntaTexto = item[campo].toString().trim();
              break;
            }
          }

          if (preguntaTexto.isEmpty) continue; // Saltar si no hay pregunta

          // Extraer tipo de pregunta
          for (String campo in ['Tipo', 'tipo', 'type']) {
            if (item.containsKey(campo) && item[campo] != null) {
              String tipoRaw = item[campo].toString().toLowerCase().trim();

              // Normalizar tipos
              if (tipoRaw.contains('multiple') || tipoRaw.contains('opcion')) {
                tipo = 'multiple-choice';
              } else if (tipoRaw.contains('true') ||
                  tipoRaw.contains('falso') ||
                  tipoRaw.contains('verdadero')) {
                tipo = 'true-false';
              } else {
                tipo = tipoRaw;
              }
              break;
            }
          }

          // Extraer puntos
          for (String campo in ['Puntos', 'puntos', 'value', 'points']) {
            if (item.containsKey(campo) && item[campo] != null) {
              puntos = int.tryParse(item[campo].toString()) ?? 10;
              break;
            }
          }

          // Extraer explicación
          for (String campo in [
            'Explicacion',
            'explicacion',
            'feedback',
            'explanation'
          ]) {
            if (item.containsKey(campo) && item[campo] != null) {
              explicacion = item[campo].toString().trim();
              break;
            }
          }

          // Detectar formato de opciones
          // Método 1: Opcion1, Opcion2, etc.
          for (int i = 1; i <= 6; i++) {
            // Soportar hasta 6 opciones
            String textoKey = 'Opcion$i';
            String correctaKey = 'Correcta$i';

            if (!item.containsKey(textoKey) &&
                !item.containsKey(textoKey.toLowerCase())) {
              textoKey = 'opcion$i'; // Probar con minúsculas
            }

            if (!item.containsKey(correctaKey) &&
                !item.containsKey(correctaKey.toLowerCase())) {
              // Probar con diferentes variantes
              for (String posibleKey in [
                'EsCorrecta$i',
                'esCorrecta$i',
                'isCorrect$i',
                'correct$i'
              ]) {
                if (item.containsKey(posibleKey)) {
                  correctaKey = posibleKey;
                  break;
                }
              }
            }

            // Si no encontramos la clave de texto, intentar con alternative_keys
            if (!item.containsKey(textoKey)) {
              for (String alt in [
                'option$i',
                'Option$i',
                'answer$i',
                'Answer$i'
              ]) {
                if (item.containsKey(alt)) {
                  textoKey = alt;
                  break;
                }
              }
            }

            if (item.containsKey(textoKey) &&
                item[textoKey] != null &&
                item[textoKey].toString().trim().isNotEmpty) {
              bool esCorrecta = false;
              // Determinar si es correcta
              if (item.containsKey(correctaKey)) {
                var valor = item[correctaKey];
                esCorrecta = valor == true ||
                    valor == 1 ||
                    valor == '1' ||
                    valor.toString().toLowerCase() == 'true' ||
                    valor.toString().toLowerCase() == 'verdadero' ||
                    valor.toString().toLowerCase() == 'sí' ||
                    valor.toString().toLowerCase() == 'si';
              } else if (item.containsKey('RespuestaCorrecta') ||
                  item.containsKey('respuestaCorrecta')) {
                String respCorrecta = (item['RespuestaCorrecta'] ??
                        item['respuestaCorrecta'] ??
                        '')
                    .toString();
                esCorrecta =
                    respCorrecta == textoKey || respCorrecta == i.toString();
              }

              opciones.add({
                'texto': item[textoKey].toString().trim(),
                'esCorrecta': esCorrecta
              });
            }
          }

          // Si no se encontraron opciones con el método anterior, buscar arrays de opciones
          if (opciones.isEmpty) {
            for (String arrayKey in [
              'opciones',
              'Opciones',
              'options',
              'Options',
              'answers',
              'Answers'
            ]) {
              if (item.containsKey(arrayKey) && item[arrayKey] is List) {
                List<dynamic> opcionesArray = item[arrayKey];

                // Buscar cuál es la respuesta correcta
                int correctIndex = -1;
                if (item.containsKey('respuestaCorrecta') ||
                    item.containsKey('RespuestaCorrecta')) {
                  correctIndex = int.tryParse((item['respuestaCorrecta'] ??
                              item['RespuestaCorrecta'] ??
                              '-1')
                          .toString()) ??
                      -1;
                  correctIndex--; // Ajustar índice (suponiendo que comienza en 1)
                }

                for (int i = 0; i < opcionesArray.length; i++) {
                  var opcion = opcionesArray[i];
                  String textoOpcion = '';
                  bool esCorrecta = i == correctIndex;

                  // La opción puede ser un string o un objeto
                  if (opcion is String) {
                    textoOpcion = opcion.trim();
                  } else if (opcion is Map) {
                    for (String textKey in [
                      'texto',
                      'text',
                      'value',
                      'label'
                    ]) {
                      if (opcion.containsKey(textKey)) {
                        textoOpcion = opcion[textKey].toString().trim();
                        break;
                      }
                    }

                    for (String correctKey in [
                      'esCorrecta',
                      'correct',
                      'isCorrect'
                    ]) {
                      if (opcion.containsKey(correctKey)) {
                        var valor = opcion[correctKey];
                        esCorrecta = valor == true ||
                            valor == 1 ||
                            valor.toString().toLowerCase() == 'true';
                        break;
                      }
                    }
                  }

                  if (textoOpcion.isNotEmpty) {
                    opciones
                        .add({'texto': textoOpcion, 'esCorrecta': esCorrecta});
                  }
                }

                if (opciones.isNotEmpty) break;
              }
            }
          }

          // Si llegamos aquí y no hay opciones pero es una pregunta true/false, crear opciones
          if (opciones.isEmpty &&
              (tipo == 'true-false' || tipo.contains('verdadero'))) {
            String respuestaCorrecta = '';

            for (String campo in [
              'respuestaCorrecta',
              'RespuestaCorrecta',
              'Correcta',
              'correcta',
              'correct'
            ]) {
              if (item.containsKey(campo)) {
                respuestaCorrecta = item[campo].toString().toLowerCase().trim();
                break;
              }
            }

            bool esVerdadero = respuestaCorrecta == 'true' ||
                respuestaCorrecta == 'verdadero' ||
                respuestaCorrecta == 'v' ||
                respuestaCorrecta == '1';

            opciones = [
              {'texto': 'Verdadero', 'esCorrecta': esVerdadero},
              {'texto': 'Falso', 'esCorrecta': !esVerdadero}
            ];
          }

          // Si hay opciones válidas, añadir la pregunta
          if (opciones.isNotEmpty) {
            preguntas.add({
              'texto': preguntaTexto,
              'tipo': tipo,
              'puntos': puntos,
              'opciones': opciones,
              'explicacion': explicacion
            });
          }
        }
      }
    } catch (e) {
      print('Error al procesar datos de cuestionario: $e');
    }

    return preguntas;
  }

  void _debugExtractedUnits(String content) {
    print('===== DEPURACIÓN DE UNIDADES =====');
    final units = _extractUnitsFromDocContent(content);

    print('Se encontraron ${units.length} unidades:');
    for (var unit in units) {
      print('Unidad ${unit['order']}: ${unit['title']}');
      print(
          'Primeros 100 caracteres del contenido: ${unit['content'].substring(0, min<int>(100, unit['content'].length))}...');
      print('-----------------------------------');
    }
  }

  @override
  void dispose() {
    _client?.close();
    super.dispose();
  }
}

// Clase modelo para archivos de Google Drive
class DriveFile {
  final String id;
  final String name;
  final String modifiedTime;

  DriveFile({
    required this.id,
    required this.name,
    required this.modifiedTime,
  });
}
