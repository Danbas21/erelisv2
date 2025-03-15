// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaderboardEntry _$LeaderboardEntryFromJson(Map<String, dynamic> json) =>
    _LeaderboardEntry(
      userId: json['userId'] as String,
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String? ?? '',
      score: (json['score'] as num).toInt(),
    );

Map<String, dynamic> _$LeaderboardEntryToJson(_LeaderboardEntry instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'score': instance.score,
    };
