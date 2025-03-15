// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CourseEntity _$CourseEntityFromJson(Map<String, dynamic> json) =>
    _CourseEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      totalChapters: (json['totalChapters'] as num).toInt(),
      completedChapters: (json['completedChapters'] as num?)?.toInt() ?? 0,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      chapters: (json['chapters'] as List<dynamic>?)
              ?.map((e) => ChapterEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CourseEntityToJson(_CourseEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'totalChapters': instance.totalChapters,
      'completedChapters': instance.completedChapters,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'chapters': instance.chapters,
    };
