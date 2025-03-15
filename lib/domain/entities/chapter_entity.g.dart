// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChapterEntity _$ChapterEntityFromJson(Map<String, dynamic> json) =>
    _ChapterEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      chapterNumber: (json['chapterNumber'] as num).toInt(),
      isCompleted: json['isCompleted'] as bool? ?? false,
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => TaskEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ChapterEntityToJson(_ChapterEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'chapterNumber': instance.chapterNumber,
      'isCompleted': instance.isCompleted,
      'tasks': instance.tasks,
    };
