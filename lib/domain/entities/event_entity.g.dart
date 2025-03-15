// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventEntity _$EventEntityFromJson(Map<String, dynamic> json) => _EventEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      imageUrl: json['imageUrl'] as String? ?? '',
      status: json['status'] as String? ?? 'Coming soon',
    );

Map<String, dynamic> _$EventEntityToJson(_EventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
      'imageUrl': instance.imageUrl,
      'status': instance.status,
    };
