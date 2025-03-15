// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubjectModel _$SubjectModelFromJson(Map<String, dynamic> json) =>
    _SubjectModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      isEnabled: json['isEnabled'] as bool? ?? false,
    );

Map<String, dynamic> _$SubjectModelToJson(_SubjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'isEnabled': instance.isEnabled,
    };
