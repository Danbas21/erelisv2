// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leader_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaderEntity _$LeaderEntityFromJson(Map<String, dynamic> json) =>
    _LeaderEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String,
      score: (json['score'] as num).toInt(),
    );

Map<String, dynamic> _$LeaderEntityToJson(_LeaderEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'score': instance.score,
    };
