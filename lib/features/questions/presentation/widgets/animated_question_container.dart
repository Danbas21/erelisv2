// lib/features/test/presentation/widgets/animated_question_container.dart
import 'package:flutter/material.dart';
import '../../domain/models/question.dart';
import '../styles/chalkboard_theme.dart';

class AnimatedQuestionContainer extends StatelessWidget {
  final Question question;
  final int? selectedOptionIndex;
  final Function(int) onOptionSelected;
  final int questionIndex;
  final int prevQuestionIndex;

  const AnimatedQuestionContainer({
    Key? key,
    required this.question,
    this.selectedOptionIndex,
    required this.onOptionSelected,
    required this.questionIndex,
    required this.prevQuestionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determinar la dirección de la animación
    final isForward = questionIndex > prevQuestionIndex;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (Widget child, Animation<double> animation) {
        final beginOffset = isForward
            ? const Offset(1.0, 0.0) // Desde la derecha
            : const Offset(-1.0, 0.0); // Desde la izquierda

        return SlideTransition(
          position: Tween<Offset>(
            begin: beginOffset,
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          )),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: Container(
        key: ValueKey<String>(question.id),
        width: double.infinity,
        decoration: ChalkboardTheme.chalkboardDecoration,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título de la categoría (con efecto de tiza)
              Text(
                question.type,
                style: ChalkboardTheme.chalkSubtitleStyle.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 16),

              // Texto de la pregunta (con efecto de tiza)
              Text(
                question.text,
                style: ChalkboardTheme.chalkTitleStyle,
              ),
              const SizedBox(height: 32),

              // Opciones de respuesta con animación
              ...List.generate(
                question.options.length,
                (index) => AnimatedOpacity(
                  opacity: 1.0,
                  duration: Duration(milliseconds: 300 + (index * 100)),
                  curve: Curves.easeInOut,
                  child: _buildOptionItem(
                    context,
                    index,
                    question.options[index].text,
                  ),
                ),
              ),
            ],
          ),
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
        decoration: isSelected
            ? ChalkboardTheme.selectedOptionDecoration
            : ChalkboardTheme.optionDecoration,
        child: Row(
          children: [
            // Círculo para seleccionar
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

            // Texto de la opción
            Expanded(
              child: Text(
                optionText,
                style: ChalkboardTheme.chalkTextStyle.copyWith(
                  fontSize: 20,
                  color: isSelected ? Colors.white : Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
