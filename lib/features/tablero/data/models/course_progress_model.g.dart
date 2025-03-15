// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_progress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CourseProgressModel _$CourseProgressModelFromJson(Map<String, dynamic> json) =>
    _CourseProgressModel(
      id: json['id'] as String,
      courseId: json['courseId'] as String,
      chapterName: json['chapterName'] as String,
      chapterNumber: (json['chapterNumber'] as num).toInt(),
      progressPercentage: (json['progressPercentage'] as num).toDouble(),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$CourseProgressModelToJson(
        _CourseProgressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'chapterName': instance.chapterName,
      'chapterNumber': instance.chapterNumber,
      'progressPercentage': instance.progressPercentage,
      'userId': instance.userId,
    };
