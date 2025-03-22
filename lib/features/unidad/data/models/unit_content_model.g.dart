// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UnitContentModel _$UnitContentModelFromJson(Map<String, dynamic> json) =>
    _UnitContentModel(
      id: json['id'] as String,
      unitId: json['unitId'] as String,
      title: json['title'] as String,
      text: json['text'] as String,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UnitContentModelToJson(_UnitContentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'unitId': instance.unitId,
      'title': instance.title,
      'text': instance.text,
      'tags': instance.tags,
    };
