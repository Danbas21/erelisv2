// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highlight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HighlightModel _$HighlightModelFromJson(Map<String, dynamic> json) =>
    _HighlightModel(
      id: json['id'] as String,
      unitId: json['unitId'] as String,
      userId: json['userId'] as String,
      text: json['text'] as String,
      startOffset: (json['startOffset'] as num).toInt(),
      endOffset: (json['endOffset'] as num).toInt(),
      colorHex: json['colorHex'] as String,
    );

Map<String, dynamic> _$HighlightModelToJson(_HighlightModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'unitId': instance.unitId,
      'userId': instance.userId,
      'text': instance.text,
      'startOffset': instance.startOffset,
      'endOffset': instance.endOffset,
      'colorHex': instance.colorHex,
    };
