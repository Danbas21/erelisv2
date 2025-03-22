// lib/features/test/presentation/pages/test_summary_page.dart
import 'package:flutter/material.dart';
import '../../domain/models/question.dart';

class TestSummaryPage extends StatelessWidget {
  final List<Question> questions;
  final Map<String, int> userAnswers;
  final VoidCallback onSubmit;
  final VoidCallback onReturn;

  const TestSummaryPage({
    Key? key,
    required this.questions,
    required this.userAnswers,
    required this.onSubmit,
    required this.onReturn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calcular estadísticas
    final totalQuestions = questions.length;
    final answeredQuestions = userAnswers.length;
    final notAnsweredQuestions = totalQuestions - answeredQuestions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen del Examen'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // Gráfico circular de progreso
          Container(
            height: 200,
            padding: const EdgeInsets.all(24.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    value: answeredQuestions / totalQuestions,
                    strokeWidth: 12,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$answeredQuestions/$totalQuestions',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('Respondidas'),
                  ],
                ),
              ],
            ),
          ),

          // Estadísticas
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Resumen de respuestas',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    _buildStatusRow(
                      context,
                      'Preguntas respondidas',
                      answeredQuestions,
                      Colors.green,
                    ),
                    const SizedBox(height: 8),
                    _buildStatusRow(
                      context,
                      'Preguntas sin responder',
                      notAnsweredQuestions,
                      Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Lista de preguntas
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                final isAnswered = userAnswers.containsKey(question.id);

                return Card(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: isAnswered
                          ? Colors.green.shade100
                          : Colors.red.shade100,
                      child: Icon(
                        isAnswered ? Icons.check : Icons.help_outline,
                        color: isAnswered ? Colors.green : Colors.red,
                      ),
                    ),
                    title: Text(
                      'Pregunta ${index + 1}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      question.text.length > 50
                          ? '${question.text.substring(0, 50)}...'
                          : question.text,
                    ),
                    trailing: isAnswered
                        ? const Text(
                            'Respondida',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const Text(
                            'Sin responder',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                  ),
                );
              },
            ),
          ),

          // Botones de acción
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: onReturn,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Volver al examen'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade700,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: notAnsweredQuestions > 0
                      ? () {
                          // Mostrar advertencia si hay preguntas sin responder
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Preguntas sin responder'),
                              content: Text(
                                  'Tienes $notAnsweredQuestions preguntas sin responder. ¿Deseas continuar y enviar el examen?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cancelar'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    onSubmit();
                                  },
                                  child: const Text('Enviar de todos modos'),
                                ),
                              ],
                            ),
                          );
                        }
                      : onSubmit,
                  icon: const Icon(Icons.send),
                  label: const Text('Enviar examen'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRow(
    BuildContext context,
    String label,
    int count,
    Color color,
  ) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(label),
        ),
        Text(
          '$count',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
