// lib/features/test/presentation/pages/test_results_detail_page.dart
import 'package:flutter/material.dart';
import '../../domain/models/question.dart';

class TestResultsDetailPage extends StatelessWidget {
  final List<Question> questions;
  final TestResult result;

  const TestResultsDetailPage({
    Key? key,
    required this.questions,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de Resultados'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          final question = questions[index];
          final userAnswer = result.answers.firstWhere(
            (answer) => answer.questionId == question.id,
            orElse: () => UserAnswer(
              questionId: question.id,
              selectedOptionIndex: -1,
              isCorrect: false,
            ),
          );

          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: ExpansionTile(
              title: Text(
                'Pregunta ${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                userAnswer.isCorrect ? '✓ Correcta' : '✗ Incorrecta',
                style: TextStyle(
                  color: userAnswer.isCorrect ? Colors.green : Colors.red,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        question.text,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Opciones
                      ...List.generate(
                        question.options.length,
                        (optionIndex) {
                          final option = question.options[optionIndex];
                          final isUserSelection =
                              userAnswer.selectedOptionIndex == optionIndex;

                          return Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: option.isCorrect
                                  ? Colors.green.withOpacity(0.1)
                                  : (isUserSelection && !option.isCorrect
                                      ? Colors.red.withOpacity(0.1)
                                      : Colors.grey.withOpacity(0.05)),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: option.isCorrect
                                    ? Colors.green
                                    : (isUserSelection && !option.isCorrect
                                        ? Colors.red
                                        : Colors.grey.withOpacity(0.3)),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  margin: const EdgeInsets.only(right: 12.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: option.isCorrect
                                        ? Colors.green
                                        : (isUserSelection && !option.isCorrect
                                            ? Colors.red
                                            : Colors.transparent),
                                    border:
                                        !option.isCorrect && !isUserSelection
                                            ? Border.all(color: Colors.grey)
                                            : null,
                                  ),
                                  child: option.isCorrect || isUserSelection
                                      ? Icon(
                                          option.isCorrect
                                              ? Icons.check
                                              : Icons.close,
                                          color: Colors.white,
                                          size: 16,
                                        )
                                      : null,
                                ),
                                Expanded(
                                  child: Text(option.text),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      if (question.explanation.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 8),
                        const Text(
                          'Explicación:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          question.explanation,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
