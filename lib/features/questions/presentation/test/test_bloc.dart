import 'package:erelis/features/questions/domain/models/question.dart';
import 'package:erelis/features/questions/domain/repositories/test_result_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/question_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_event.dart';
part 'test_state.dart';
part 'test_bloc.freezed.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final QuestionRepository questionRepository;
  final TestResultRepository resultRepository;

  TestBloc({
    required this.questionRepository,
    required this.resultRepository,
  }) : super(const TestState.initial()) {
    on<_Started>(_onStarted);
    on<_AnswerSelected>(_onAnswerSelected);
    on<_NextQuestion>(_onNextQuestion);
    on<_PreviousQuestion>(_onPreviousQuestion);
    on<_NavigateToQuestion>(_onNavigateToQuestion);
    on<_SaveProgress>(_onSaveProgress);
    on<_SubmitTest>(_onSubmitTest);
  }

  Future<void> _onStarted(
    _Started event,
    Emitter<TestState> emit,
  ) async {
    emit(const TestState.loading());

    try {
      final questions = await questionRepository.getQuestions(
        event.courseId,
        event.unitId,
      );

      emit(TestState.loaded(
        questions: questions,
        currentQuestionIndex: 0,
        userAnswers: {},
        isCompleted: false,
      ));
    } catch (e) {
      emit(TestState.error(e.toString()));
    }
  }

  Future<void> _onAnswerSelected(
    _AnswerSelected event,
    Emitter<TestState> emit,
  ) async {
    final currentState = state;

    if (currentState is Loaded) {
      final updatedAnswers = Map<String, int>.from(currentState.userAnswers);
      updatedAnswers[event.questionId] = event.optionIndex;

      emit(currentState.copyWith(userAnswers: updatedAnswers));
    }
  }

  // Implementación de otros manejadores de eventos...
  Future<void> _onNextQuestion(
    _NextQuestion event,
    Emitter<TestState> emit,
  ) async {
    final currentState = state;

    if (currentState is Loaded) {
      final nextIndex = currentState.currentQuestionIndex + 1;

      if (nextIndex < currentState.questions.length) {
        emit(currentState.copyWith(currentQuestionIndex: nextIndex));
      }
    }
  }

  Future<void> _onPreviousQuestion(
    _PreviousQuestion event,
    Emitter<TestState> emit,
  ) async {
    final currentState = state;

    if (currentState is Loaded) {
      final prevIndex = currentState.currentQuestionIndex - 1;

      if (prevIndex >= 0) {
        emit(currentState.copyWith(currentQuestionIndex: prevIndex));
      }
    }
  }

  Future<void> _onNavigateToQuestion(
    _NavigateToQuestion event,
    Emitter<TestState> emit,
  ) async {
    final currentState = state;

    if (currentState is Loaded) {
      if (event.index >= 0 && event.index < currentState.questions.length) {
        emit(currentState.copyWith(currentQuestionIndex: event.index));
      }
    }
  }

  Future<void> _onSaveProgress(
    _SaveProgress event,
    Emitter<TestState> emit,
  ) async {
    final currentState = state;

    if (currentState is Loaded) {
      try {
        // Implementar lógica para guardar el progreso
        await questionRepository.saveUserProgress(
          // Aquí deberías incluir el courseId y unitId que podrías
          // agregar al estado o pasar como parámetros al evento
          'courseId',
          'unitId',
          'userId', // Deberías obtener esto de algún servicio de autenticación
          currentState.userAnswers,
        );

        // Mostrar mensaje de éxito (podrías usar un BlocListener en la UI)
      } catch (e) {
        emit(TestState.error(e.toString()));
      }
    }
  }

  Future<void> _onSubmitTest(
    _SubmitTest event,
    Emitter<TestState> emit,
  ) async {
    final currentState = state;

    if (currentState is Loaded) {
      try {
        // Calcular resultados
        final answers = <UserAnswer>[];
        int totalPoints = 0;
        int earnedPoints = 0;

        for (final question in currentState.questions) {
          totalPoints += question.points;

          final selectedOptionIndex = currentState.userAnswers[question.id];
          bool isCorrect = false;

          if (selectedOptionIndex != null) {
            isCorrect = question.options[selectedOptionIndex].isCorrect;

            if (isCorrect) {
              earnedPoints += question.points;
            }
          }

          answers.add(UserAnswer(
            questionId: question.id,
            selectedOptionIndex: selectedOptionIndex ?? -1,
            isCorrect: isCorrect,
          ));
        }

        final percentage =
            totalPoints > 0 ? (earnedPoints / totalPoints) * 100 : 0.0;

        final result = TestResult(
          testId: '',
          answers: answers,
          totalPoints: totalPoints,
          earnedPoints: earnedPoints,
          percentage: percentage,
          isCompleted: true,
        );

        // Guardar resultado
        await resultRepository.saveTestResult(result);

        // Emitir estado completado
        emit(TestState.completed(result: result));
      } catch (e) {
        emit(TestState.error(e.toString()));
      }
    }
  }
}
