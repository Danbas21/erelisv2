// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgressEntity _$ProgressEntityFromJson(Map<String, dynamic> json) =>
    _ProgressEntity(
      courseId: json['courseId'] as String,
      courseName: json['courseName'] as String,
      chapterNumber: (json['chapterNumber'] as num).toInt(),
      chapterName: json['chapterName'] as String,
      progressPercentage: (json['progressPercentage'] as num).toDouble(),
    );

Map<String, dynamic> _$ProgressEntityToJson(_ProgressEntity instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'courseName': instance.courseName,
      'chapterNumber': instance.chapterNumber,
      'chapterName': instance.chapterName,
      'progressPercentage': instance.progressPercentage,
    };
