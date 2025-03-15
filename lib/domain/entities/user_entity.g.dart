// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => _UserEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      photoUrl: json['photoUrl'] as String? ?? '',
      enrolledCourses: (json['enrolledCourses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserEntityToJson(_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'photoUrl': instance.photoUrl,
      'enrolledCourses': instance.enrolledCourses,
    };
