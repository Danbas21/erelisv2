// lib/features/test/presentation/pages/test_page.dart
import 'package:erelis/features/questions/presentation/helpers/responsive_layout.dart';
import 'package:erelis/features/questions/presentation/test/test_bloc.dart';
import 'package:erelis/features/questions/presentation/widgets/animated_question_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/progress_sidebar.dart';

class TestPage extends StatelessWidget {
  final String courseId;
  final String unitId;
  final String title;

  const TestPage({
    super.key,
    required this.courseId,
    required this.unitId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestBloc(
        questionRepository: context.read(),
        resultRepository: context.read(),
      )..add(TestEvent.started(courseId, unitId)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Mostrar diálogo para confirmar salida
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('¿Salir del examen?'),
                  content: const Text('Tu progreso no guardado se perderá.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Cerrar diálogo
                        Navigator.pop(context); // Volver a la pantalla anterior
                      },
                      child: const Text('Salir'),
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.help_outline),
              onPressed: () {
                // Mostrar instrucciones
              },
            ),
          ],
        ),
        body: BlocBuilder<TestBloc, TestState>(
          builder: (context, state) {
            return switch (state) {
              Initial() => const Center(child: Text('Inicializando...')),
              Loading() => const Center(child: CircularProgressIndicator()),
              Loaded loaded => ResponsiveLayout.builder(
                  context: context,
                  builder: (context, deviceType) {
                    return _buildResponsiveTestContent(
                      context,
                      loaded,
                      deviceType,
                    );
                  },
                ),
              Completed completed => _buildTestResults(context, completed),
              Error error => Center(child: Text('Error: ${error.message}')),
            };
          },
        ),
      ),
    );
  }

  Widget _buildResponsiveTestContent(
    BuildContext context,
    Loaded state,
    DeviceType deviceType,
  ) {
    // Para dispositivos móviles
    if (deviceType == DeviceType.mobile) {
      return Column(
        children: [
          // Indicador de progreso simple para móviles
          LinearProgressIndicator(
            value: (state.currentQuestionIndex + 1) / state.questions.length,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary,
            ),
          ),

          // Número de pregunta actual
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pregunta ${state.currentQuestionIndex + 1} de ${state.questions.length}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Mostrar diálogo con todas las preguntas para navegación
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => _buildMobileProgressSheet(
                        context,
                        state,
                      ),
                    );
                  },
                  child: Row(
                    children: const [
                      Text('Ver todas'),
                      Icon(Icons.list),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Contenido de la pregunta
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AnimatedQuestionContainer(
                question: state.questions[state.currentQuestionIndex],
                selectedOptionIndex: state.userAnswers[
                    state.questions[state.currentQuestionIndex].id],
                onOptionSelected: (optionIndex) {
                  context.read<TestBloc>().add(
                        TestEvent.answerSelected(
                          state.questions[state.currentQuestionIndex].id,
                          optionIndex,
                        ),
                      );
                },
                questionIndex: state.currentQuestionIndex,
                prevQuestionIndex: state.currentQuestionIndex > 0
                    ? state.currentQuestionIndex - 1
                    : 0,
              ),
            ),
          ),

          // Barra de navegación inferior
          _buildNavigationBar(context, state),
        ],
      );
    }

    // Para tablet y desktop
    return Row(
      children: [
        // Barra lateral de progreso
        SizedBox(
          width: deviceType == DeviceType.desktop ? 280 : 240,
          child: ProgressSidebar(
            questions: state.questions,
            currentIndex: state.currentQuestionIndex,
            userAnswers: state.userAnswers,
            onQuestionSelected: (index) {
              context.read<TestBloc>().add(TestEvent.navigateToQuestion(index));
            },
          ),
        ),

        // Contenido principal
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: AnimatedQuestionContainer(
                    question: state.questions[state.currentQuestionIndex],
                    selectedOptionIndex: state.userAnswers[
                        state.questions[state.currentQuestionIndex].id],
                    onOptionSelected: (optionIndex) {
                      context.read<TestBloc>().add(
                            TestEvent.answerSelected(
                              state.questions[state.currentQuestionIndex].id,
                              optionIndex,
                            ),
                          );
                    },
                    questionIndex: state.currentQuestionIndex,
                    prevQuestionIndex: state.currentQuestionIndex > 0
                        ? state.currentQuestionIndex - 1
                        : 0,
                  ),
                ),
              ),

              // Barra de navegación inferior
              _buildNavigationBar(context, state),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileProgressSheet(BuildContext context, Loaded state) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Navegación de preguntas',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: state.questions.length,
              itemBuilder: (context, index) {
                final questionId = state.questions[index].id;
                final isAnswered = state.userAnswers.containsKey(questionId);
                final isCurrentQuestion = index == state.currentQuestionIndex;

                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    context
                        .read<TestBloc>()
                        .add(TestEvent.navigateToQuestion(index));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isCurrentQuestion
                          ? Theme.of(context).colorScheme.primary
                          : (isAnswered
                              ? Colors.blue.withValues(alpha: 0.3)
                              : Colors.grey.withValues(alpha: 0.2)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: isCurrentQuestion ? Colors.white : null,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationBar(BuildContext context, Loaded state) {
    final isFirstQuestion = state.currentQuestionIndex == 0;
    final isLastQuestion =
        state.currentQuestionIndex == state.questions.length - 1;
    final hasSelectedAnswer = state.userAnswers.containsKey(
      state.questions[state.currentQuestionIndex].id,
    );

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Botón atrás
          ElevatedButton.icon(
            onPressed: isFirstQuestion
                ? null
                : () => context
                    .read<TestBloc>()
                    .add(const TestEvent.previousQuestion()),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Anterior'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
          ),

          // Botón guardar progreso
          ElevatedButton.icon(
            onPressed: () =>
                context.read<TestBloc>().add(const TestEvent.saveProgress()),
            icon: const Icon(Icons.save),
            label: const Text('Guardar Progreso'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
          ),

          // Botón siguiente o finalizar
          ElevatedButton.icon(
            onPressed: hasSelectedAnswer
                ? () {
                    if (isLastQuestion) {
                      // Confirmar finalización
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('¿Finalizar examen?'),
                          content: const Text(
                              'Una vez calificado, no podrás cambiar tus respuestas.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                context
                                    .read<TestBloc>()
                                    .add(const TestEvent.submitTest());
                              },
                              child: const Text('Finalizar'),
                            ),
                          ],
                        ),
                      );
                    } else {
                      context
                          .read<TestBloc>()
                          .add(const TestEvent.nextQuestion());
                    }
                  }
                : null,
            icon:
                Icon(isLastQuestion ? Icons.check_circle : Icons.arrow_forward),
            label: Text(isLastQuestion ? 'Finalizar' : 'Siguiente'),
            style: ElevatedButton.styleFrom(
              backgroundColor: isLastQuestion ? Colors.green : Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestResults(BuildContext context, Completed state) {
    final result = state.result;
    final percentage = result.percentage;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          const Icon(
            Icons.check_circle,
            size: 80,
            color: Colors.green,
          ),
          const SizedBox(height: 24),
          Text(
            'Examen Completado',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'Tu calificación: ${result.earnedPoints} / ${result.totalPoints}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            '${percentage.toStringAsFixed(1)}%',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: percentage >= 70 ? Colors.green : Colors.red,
                ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              // Navegar a la pantalla de revisión detallada
            },
            icon: const Icon(Icons.list),
            label: const Text('Ver detalle de respuestas'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.home),
            label: const Text('Volver al curso'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
