// lib/features/test/presentation/widgets/question_container.dart
import 'package:flutter/material.dart';
import '../../domain/models/question.dart';

class QuestionContainer extends StatelessWidget {
  final Question question;
  final int? selectedOptionIndex;
  final Function(int) onOptionSelected;

  const QuestionContainer({
    Key? key,
    required this.question,
    this.selectedOptionIndex,
    required this.onOptionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1A5B1A), // Color verde pizarrón
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF8D6E63), // Color café para el marco
          width: 8,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de la categoría
            Text(
              question.type,
              style: const TextStyle(
                fontFamily: 'Chalk',
                color: Colors.white70,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 16),

            // Texto de la pregunta
            Text(
              question.text,
              style: const TextStyle(
                fontFamily: 'Chalk',
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),

            // Opciones de respuesta
            ...List.generate(
              question.options.length,
              (index) => _buildOptionItem(
                context,
                index,
                question.options[index].text,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionItem(BuildContext context, int index, String optionText) {
    final isSelected = selectedOptionIndex == index;

    return GestureDetector(
      onTap: () => onOptionSelected(index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withOpacity(0.3)
              : Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.white30,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.white : Colors.transparent,
                border: Border.all(
                  color: Colors.white70,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      color: Color(0xFF1A5B1A),
                      size: 20,
                    )
                  : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                optionText,
                style: TextStyle(
                  fontFamily: 'Chalk',
                  color: isSelected ? Colors.white : Colors.white70,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
