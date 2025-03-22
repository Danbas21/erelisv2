part of 'test_bloc.dart';

@freezed
sealed class TestEvent with _$TestEvent {
  const factory TestEvent.started(String courseId, String unitId) = _Started;
  const factory TestEvent.answerSelected(String questionId, int optionIndex) =
      _AnswerSelected;
  const factory TestEvent.nextQuestion() = _NextQuestion;
  const factory TestEvent.previousQuestion() = _PreviousQuestion;
  const factory TestEvent.navigateToQuestion(int index) = _NavigateToQuestion;
  const factory TestEvent.saveProgress() = _SaveProgress;
  const factory TestEvent.submitTest() = _SubmitTest;
}
