// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskEntity _$TaskEntityFromJson(Map<String, dynamic> json) => _TaskEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      page: json['page'] as String,
      dueTime: json['dueTime'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$TaskEntityToJson(_TaskEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'page': instance.page,
      'dueTime': instance.dueTime,
      'isCompleted': instance.isCompleted,
    };
