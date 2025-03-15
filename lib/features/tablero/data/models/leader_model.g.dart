// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leader_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaderModel _$LeaderModelFromJson(Map<String, dynamic> json) => _LeaderModel(
      id: json['id'] as String,
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String,
      score: (json['score'] as num).toInt(),
    );

Map<String, dynamic> _$LeaderModelToJson(_LeaderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'score': instance.score,
    };
