part of 'test_bloc.dart';

@freezed
sealed class TestState with _$TestState {
  const factory TestState.initial() = Initial;
  const factory TestState.loading() = Loading;
  const factory TestState.loaded({
    required List<Question> questions,
    required int currentQuestionIndex,
    required Map<String, int> userAnswers,
    required bool isCompleted,
  }) = Loaded;
  const factory TestState.completed({
    required TestResult result,
  }) = Completed;
  const factory TestState.error(String message) = Error;
}
