import 'package:erelis/data/datasources/firebase/docs_goog.dart';
import 'package:googleapis/sheets/v4.dart' as sheets;
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> importFromGoogleSheets(String courseId, String unitId,
    String spreadsheetId, String sheetName, String testTitle) async {
  // Autenticación
  final client = await obtainAuthenticatedClient();

  // Obtener datos del spreadsheet
  final sheetsApi = sheets.SheetsApi(client);
  final response = await sheetsApi.spreadsheets.values.get(spreadsheetId,
      '$sheetName!A1:Z1000' // Rango que incluye todas tus preguntas
      );

  final rows = response.values ?? [];
  if (rows.isEmpty) {
    print('No se encontraron datos en la hoja');
    return;
  }

  // Ignorar encabezados
  final dataRows = rows.sublist(1);

  // Procesar preguntas (similar al proceso anterior pero con datos de la API)
  List<Map<String, dynamic>> questions = [];
  // Código para procesar las filas...

  // Guardar test en Firestore
  await FirebaseFirestore.instance
      .collection('courses')
      .doc(courseId)
      .collection('tests')
      .add({
    'title': testTitle,
    'unitId': unitId,
    'description': 'Test importado desde Google Sheets',
    'timeLimit': 15,
    'passingScore': 70,
    'maxAttempts': 3,
    'isActive': true,
    'shuffleQuestions': true,
    'shuffleOptions': true,
    'showResultsImmediately': true,
    'questions': questions
  });
}
