// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      id: json['id'] as String,
      user: json['user'] as String,
      nombre: json['nombre'] as String,
      apellido: json['apellido'] as String,
      correo: json['correo'] as String,
      telefono: json['telefono'] as String,
      curp: json['curp'] as String,
      escuela: json['escuela'] as String,
      grado: json['grado'] as String,
      fotoUrl: json['fotoUrl'] as String?,
      rol: json['rol'] as String? ?? 'estudiante',
      permisos: (json['permisos'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as bool),
          ) ??
          const {},
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'nombre': instance.nombre,
      'apellido': instance.apellido,
      'correo': instance.correo,
      'telefono': instance.telefono,
      'curp': instance.curp,
      'escuela': instance.escuela,
      'grado': instance.grado,
      'fotoUrl': instance.fotoUrl,
      'rol': instance.rol,
      'permisos': instance.permisos,
    };
