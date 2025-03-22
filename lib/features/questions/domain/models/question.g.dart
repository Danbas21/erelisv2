// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Question _$QuestionFromJson(Map<String, dynamic> json) => _Question(
      id: json['id'] as String,
      text: json['text'] as String,
      type: json['type'] as String,
      points: (json['points'] as num).toInt(),
      options: (json['options'] as List<dynamic>)
          .map((e) => QuestionOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      explanation: json['explanation'] as String,
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$QuestionToJson(_Question instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'type': instance.type,
      'points': instance.points,
      'options': instance.options,
      'explanation': instance.explanation,
      'order': instance.order,
    };

_QuestionOption _$QuestionOptionFromJson(Map<String, dynamic> json) =>
    _QuestionOption(
      text: json['text'] as String,
      isCorrect: json['isCorrect'] as bool,
    );

Map<String, dynamic> _$QuestionOptionToJson(_QuestionOption instance) =>
    <String, dynamic>{
      'text': instance.text,
      'isCorrect': instance.isCorrect,
    };

_UserAnswer _$UserAnswerFromJson(Map<String, dynamic> json) => _UserAnswer(
      questionId: json['questionId'] as String,
      selectedOptionIndex: (json['selectedOptionIndex'] as num).toInt(),
      isCorrect: json['isCorrect'] as bool,
    );

Map<String, dynamic> _$UserAnswerToJson(_UserAnswer instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'selectedOptionIndex': instance.selectedOptionIndex,
      'isCorrect': instance.isCorrect,
    };

_TestResult _$TestResultFromJson(Map<String, dynamic> json) => _TestResult(
      testId: json['testId'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => UserAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPoints: (json['totalPoints'] as num).toInt(),
      earnedPoints: (json['earnedPoints'] as num).toInt(),
      percentage: (json['percentage'] as num).toDouble(),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$TestResultToJson(_TestResult instance) =>
    <String, dynamic>{
      'testId': instance.testId,
      'answers': instance.answers,
      'totalPoints': instance.totalPoints,
      'earnedPoints': instance.earnedPoints,
      'percentage': instance.percentage,
      'isCompleted': instance.isCompleted,
    };
