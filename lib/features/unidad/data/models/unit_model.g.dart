// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UnitModel _$UnitModelFromJson(Map<String, dynamic> json) => _UnitModel(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
      courseId: json['courseId'] as String,
      lastVisited: DateTime.parse(json['lastVisited'] as String),
    );

Map<String, dynamic> _$UnitModelToJson(_UnitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'isCompleted': instance.isCompleted,
      'courseId': instance.courseId,
      'lastVisited': instance.lastVisited.toIso8601String(),
    };
