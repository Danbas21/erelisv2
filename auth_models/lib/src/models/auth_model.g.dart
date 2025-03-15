// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => _AuthModel(
  user:
      json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
  token: json['token'] as String?,
  status:
      $enumDecodeNullable(_$AuthStatusEnumMap, json['status']) ??
      AuthStatus.unauthenticated,
  errorMessage: json['errorMessage'] as String?,
);

Map<String, dynamic> _$AuthModelToJson(_AuthModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'status': _$AuthStatusEnumMap[instance.status]!,
      'errorMessage': instance.errorMessage,
    };

const _$AuthStatusEnumMap = {
  AuthStatus.initial: 'initial',
  AuthStatus.loading: 'loading',
  AuthStatus.authenticated: 'authenticated',
  AuthStatus.unauthenticated: 'unauthenticated',
  AuthStatus.error: 'error',
};
