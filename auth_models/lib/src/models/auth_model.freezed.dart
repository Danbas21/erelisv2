// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthModel {

 UserModel? get user; String? get token; AuthStatus get status; String? get errorMessage;
/// Create a copy of AuthModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthModelCopyWith<AuthModel> get copyWith => _$AuthModelCopyWithImpl<AuthModel>(this as AuthModel, _$identity);

  /// Serializes this AuthModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthModel&&(identical(other.user, user) || other.user == user)&&(identical(other.token, token) || other.token == token)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,token,status,errorMessage);

@override
String toString() {
  return 'AuthModel(user: $user, token: $token, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AuthModelCopyWith<$Res>  {
  factory $AuthModelCopyWith(AuthModel value, $Res Function(AuthModel) _then) = _$AuthModelCopyWithImpl;
@useResult
$Res call({
 UserModel? user, String? token, AuthStatus status, String? errorMessage
});


$UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$AuthModelCopyWithImpl<$Res>
    implements $AuthModelCopyWith<$Res> {
  _$AuthModelCopyWithImpl(this._self, this._then);

  final AuthModel _self;
  final $Res Function(AuthModel) _then;

/// Create a copy of AuthModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? token = freezed,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AuthStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AuthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _AuthModel extends AuthModel {
  const _AuthModel({this.user, this.token, this.status = AuthStatus.unauthenticated, this.errorMessage}): super._();
  factory _AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);

@override final  UserModel? user;
@override final  String? token;
@override@JsonKey() final  AuthStatus status;
@override final  String? errorMessage;

/// Create a copy of AuthModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthModelCopyWith<_AuthModel> get copyWith => __$AuthModelCopyWithImpl<_AuthModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthModel&&(identical(other.user, user) || other.user == user)&&(identical(other.token, token) || other.token == token)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,token,status,errorMessage);

@override
String toString() {
  return 'AuthModel(user: $user, token: $token, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AuthModelCopyWith<$Res> implements $AuthModelCopyWith<$Res> {
  factory _$AuthModelCopyWith(_AuthModel value, $Res Function(_AuthModel) _then) = __$AuthModelCopyWithImpl;
@override @useResult
$Res call({
 UserModel? user, String? token, AuthStatus status, String? errorMessage
});


@override $UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$AuthModelCopyWithImpl<$Res>
    implements _$AuthModelCopyWith<$Res> {
  __$AuthModelCopyWithImpl(this._self, this._then);

  final _AuthModel _self;
  final $Res Function(_AuthModel) _then;

/// Create a copy of AuthModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? token = freezed,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_AuthModel(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AuthStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AuthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
