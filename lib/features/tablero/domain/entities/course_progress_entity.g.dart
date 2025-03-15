// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_progress_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CourseProgressEntity _$CourseProgressEntityFromJson(
        Map<String, dynamic> json) =>
    _CourseProgressEntity(
      id: json['id'] as String,
      courseId: json['courseId'] as String,
      chapterName: json['chapterName'] as String,
      chapterNumber: (json['chapterNumber'] as num).toInt(),
      progressPercentage: (json['progressPercentage'] as num).toDouble(),
    );

Map<String, dynamic> _$CourseProgressEntityToJson(
        _CourseProgressEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'chapterName': instance.chapterName,
      'chapterNumber': instance.chapterNumber,
      'progressPercentage': instance.progressPercentage,
    };
