// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExamModel _$ExamModelFromJson(Map<String, dynamic> json) => _ExamModel(
      id: json['id'] as String,
      courseId: json['courseId'] as String,
      subject: json['subject'] as String,
      chapterNumber: (json['chapterNumber'] as num).toInt(),
      pageNumber: (json['pageNumber'] as num).toInt(),
      questionCount: (json['questionCount'] as num).toInt(),
      time: json['time'] as String,
      status: $enumDecode(_$ExamStatusEnumMap, json['status']),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$ExamModelToJson(_ExamModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'subject': instance.subject,
      'chapterNumber': instance.chapterNumber,
      'pageNumber': instance.pageNumber,
      'questionCount': instance.questionCount,
      'time': instance.time,
      'status': _$ExamStatusEnumMap[instance.status]!,
      'userId': instance.userId,
    };

const _$ExamStatusEnumMap = {
  ExamStatus.pending: 'pending',
  ExamStatus.completed: 'completed',
};
