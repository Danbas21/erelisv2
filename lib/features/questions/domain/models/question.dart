import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
sealed class Question with _$Question {
  const factory Question({
    required String id,
    required String text,
    required String type,
    required int points,
    required List<QuestionOption> options,
    required String explanation,
    required int order,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

@freezed
sealed class QuestionOption with _$QuestionOption {
  const factory QuestionOption({
    required String text,
    required bool isCorrect,
  }) = _QuestionOption;

  factory QuestionOption.fromJson(Map<String, dynamic> json) =>
      _$QuestionOptionFromJson(json);
}

@freezed
sealed class UserAnswer with _$UserAnswer {
  const factory UserAnswer({
    required String questionId,
    required int selectedOptionIndex,
    required bool isCorrect,
  }) = _UserAnswer;

  factory UserAnswer.fromJson(Map<String, dynamic> json) =>
      _$UserAnswerFromJson(json);
}

@freezed
sealed class TestResult with _$TestResult {
  const factory TestResult({
    required String testId,
    required List<UserAnswer> answers,
    required int totalPoints,
    required int earnedPoints,
    required double percentage,
    @Default(false) bool isCompleted,
  }) = _TestResult;

  factory TestResult.fromJson(Map<String, dynamic> json) =>
      _$TestResultFromJson(json);
}
