// lib/features/test/presentation/widgets/progress_sidebar.dart
import 'package:flutter/material.dart';
import '../../domain/models/question.dart';

class ProgressSidebar extends StatelessWidget {
  final List<Question> questions;
  final int currentIndex;
  final Map<String, int> userAnswers;
  final Function(int) onQuestionSelected;

  const ProgressSidebar({
    Key? key,
    required this.questions,
    required this.currentIndex,
    required this.userAnswers,
    required this.onQuestionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Preguntas ${questions.length}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemBuilder: (context, index) {
                final question = questions[index];
                final isAnswered = userAnswers.containsKey(question.id);
                final isCurrentQuestion = index == currentIndex;

                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4.0,
                  ),
                  leading: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isCurrentQuestion
                          ? Theme.of(context).colorScheme.primary
                          : (isAnswered
                              ? Colors.blue.withOpacity(0.3)
                              : Colors.grey.withOpacity(0.2)),
                    ),
                    child: Center(
                      child: isAnswered
                          ? const Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                              size: 16,
                            )
                          : Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: isCurrentQuestion ? Colors.white : null,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  title: Text(
                    'Pregunta ${index + 1}',
                    style: TextStyle(
                      fontWeight: isCurrentQuestion ? FontWeight.bold : null,
                    ),
                  ),
                  subtitle: Text(
                    question.type,
                    style: const TextStyle(fontSize: 12),
                  ),
                  selected: isCurrentQuestion,
                  selectedTileColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onTap: () => onQuestionSelected(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
