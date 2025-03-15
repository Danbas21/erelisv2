// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    _UserProfileModel(
      id: json['id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      photoUrl: json['photoUrl'] as String?,
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => SubjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserProfileModelToJson(_UserProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'photoUrl': instance.photoUrl,
      'subjects': instance.subjects,
    };

_SubjectModel _$SubjectModelFromJson(Map<String, dynamic> json) =>
    _SubjectModel(
      id: json['id'] as String,
      name: json['name'] as String,
      chapterCount: (json['chapterCount'] as num).toInt(),
      completedChapters: (json['completedChapters'] as num).toInt(),
      timeSlot: json['timeSlot'] as String,
    );

Map<String, dynamic> _$SubjectModelToJson(_SubjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'chapterCount': instance.chapterCount,
      'completedChapters': instance.completedChapters,
      'timeSlot': instance.timeSlot,
    };
