import 'package:erelis/features/questions/presentation/pages/test_page.dart';
import 'package:flutter/material.dart';

class TestIntroPage extends StatelessWidget {
  final String courseId;
  final String unitId;
  final String title;
  final int questionCount;

  const TestIntroPage({
    super.key,
    required this.courseId,
    required this.unitId,
    required this.title,
    required this.questionCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Examen de Matemáticas',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),

            // Tarjeta con información del examen
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Información del examen',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow(context, 'Número de preguntas',
                        '$questionCount preguntas'),
                    _buildInfoRow(context, 'Tiempo estimado', '30 minutos'),
                    _buildInfoRow(context, 'Calificación aprobatoria', '70%'),
                    _buildInfoRow(context, 'Intentos permitidos', 'Ilimitados'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Instrucciones
            Text(
              'Instrucciones',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _buildInstructionItem(context, '1',
                'Lee cuidadosamente cada pregunta antes de seleccionar tu respuesta.'),
            _buildInstructionItem(context, '2',
                'Selecciona la opción que consideres correcta haciendo clic sobre ella.'),
            _buildInstructionItem(context, '3',
                'Puedes navegar entre preguntas utilizando los botones de navegación o la barra lateral.'),
            _buildInstructionItem(context, '4',
                'Puedes guardar tu progreso en cualquier momento y continuar más tarde.'),
            _buildInstructionItem(context, '5',
                'Una vez que hayas respondido todas las preguntas, podrás finalizar y obtener tu calificación.'),
            const SizedBox(height: 40),

            // Botón para comenzar el examen
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestPage(
                        courseId: courseId,
                        unitId: unitId,
                        title: title,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Comenzar Examen',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.play_arrow),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildInstructionItem(
      BuildContext context, String number, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
