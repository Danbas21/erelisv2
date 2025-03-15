// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfileEntity _$UserProfileEntityFromJson(Map<String, dynamic> json) =>
    _UserProfileEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      photoUrl: json['photoUrl'] as String?,
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => SubjectEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserProfileEntityToJson(_UserProfileEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'photoUrl': instance.photoUrl,
      'subjects': instance.subjects,
    };

_SubjectEntity _$SubjectEntityFromJson(Map<String, dynamic> json) =>
    _SubjectEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      chapterCount: (json['chapterCount'] as num).toInt(),
      completedChapters: (json['completedChapters'] as num).toInt(),
      timeSlot: json['timeSlot'] as String,
    );

Map<String, dynamic> _$SubjectEntityToJson(_SubjectEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'chapterCount': instance.chapterCount,
      'completedChapters': instance.completedChapters,
      'timeSlot': instance.timeSlot,
    };
