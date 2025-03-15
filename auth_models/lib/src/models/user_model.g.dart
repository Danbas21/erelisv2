// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  nombre: json['nombre'] as String?,
  apellido: json['apellido'] as String?,
  telefono: json['telefono'] as String?,
  curp: json['curp'] as String?,
  escuela: json['escuela'] as String?,
  grado: json['grado'] as String?,
  displayName: json['displayName'] as String?,
  photoUrl: json['photoUrl'] as String?,
  rol: json['rol'] as String?,
  isEmailVerified: json['isEmailVerified'] as bool? ?? false,
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  lastLoginAt:
      json['lastLoginAt'] == null
          ? null
          : DateTime.parse(json['lastLoginAt'] as String),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'nombre': instance.nombre,
      'apellido': instance.apellido,
      'telefono': instance.telefono,
      'curp': instance.curp,
      'escuela': instance.escuela,
      'grado': instance.grado,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'rol': instance.rol,
      'isEmailVerified': instance.isEmailVerified,
      'createdAt': instance.createdAt?.toIso8601String(),
      'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
    };
