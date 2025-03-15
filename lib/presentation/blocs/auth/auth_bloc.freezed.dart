// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent()';
  }
}

/// @nodoc
class $AuthEventCopyWith<$Res> {
  $AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}

/// @nodoc

class _CheckAuthStatus implements AuthEvent {
  const _CheckAuthStatus();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _CheckAuthStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.checkAuthStatus()';
  }
}

/// @nodoc

class _SignIn implements AuthEvent {
  const _SignIn({required this.email, required this.password});

  final String email;
  final String password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignInCopyWith<_SignIn> get copyWith =>
      __$SignInCopyWithImpl<_SignIn>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignIn &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'AuthEvent.signIn(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$SignInCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$SignInCopyWith(_SignIn value, $Res Function(_SignIn) _then) =
      __$SignInCopyWithImpl;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$SignInCopyWithImpl<$Res> implements _$SignInCopyWith<$Res> {
  __$SignInCopyWithImpl(this._self, this._then);

  final _SignIn _self;
  final $Res Function(_SignIn) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_SignIn(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _SignUp implements AuthEvent {
  const _SignUp(
      {required this.email,
      required this.password,
      this.displayName,
      required this.nombre,
      required this.apellido,
      required this.telefono,
      required this.curp,
      required this.escuela,
      required this.grado,
      this.foto});

  final String email;
  final String password;
  final String? displayName;
  final String nombre;
  final String apellido;
  final String telefono;
  final String curp;
  final String escuela;
  final String grado;
  final String? foto;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignUpCopyWith<_SignUp> get copyWith =>
      __$SignUpCopyWithImpl<_SignUp>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignUp &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.apellido, apellido) ||
                other.apellido == apellido) &&
            (identical(other.telefono, telefono) ||
                other.telefono == telefono) &&
            (identical(other.curp, curp) || other.curp == curp) &&
            (identical(other.escuela, escuela) || other.escuela == escuela) &&
            (identical(other.grado, grado) || other.grado == grado) &&
            (identical(other.foto, foto) || other.foto == foto));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, displayName,
      nombre, apellido, telefono, curp, escuela, grado, foto);

  @override
  String toString() {
    return 'AuthEvent.signUp(email: $email, password: $password, displayName: $displayName, nombre: $nombre, apellido: $apellido, telefono: $telefono, curp: $curp, escuela: $escuela, grado: $grado, foto: $foto)';
  }
}

/// @nodoc
abstract mixin class _$SignUpCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$SignUpCopyWith(_SignUp value, $Res Function(_SignUp) _then) =
      __$SignUpCopyWithImpl;
  @useResult
  $Res call(
      {String email,
      String password,
      String? displayName,
      String nombre,
      String apellido,
      String telefono,
      String curp,
      String escuela,
      String grado,
      String? foto});
}

/// @nodoc
class __$SignUpCopyWithImpl<$Res> implements _$SignUpCopyWith<$Res> {
  __$SignUpCopyWithImpl(this._self, this._then);

  final _SignUp _self;
  final $Res Function(_SignUp) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? displayName = freezed,
    Object? nombre = null,
    Object? apellido = null,
    Object? telefono = null,
    Object? curp = null,
    Object? escuela = null,
    Object? grado = null,
    Object? foto = freezed,
  }) {
    return _then(_SignUp(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      nombre: null == nombre
          ? _self.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      apellido: null == apellido
          ? _self.apellido
          : apellido // ignore: cast_nullable_to_non_nullable
              as String,
      telefono: null == telefono
          ? _self.telefono
          : telefono // ignore: cast_nullable_to_non_nullable
              as String,
      curp: null == curp
          ? _self.curp
          : curp // ignore: cast_nullable_to_non_nullable
              as String,
      escuela: null == escuela
          ? _self.escuela
          : escuela // ignore: cast_nullable_to_non_nullable
              as String,
      grado: null == grado
          ? _self.grado
          : grado // ignore: cast_nullable_to_non_nullable
              as String,
      foto: freezed == foto
          ? _self.foto
          : foto // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _SignOut implements AuthEvent {
  const _SignOut();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.signOut()';
  }
}

/// @nodoc

class _UpdateProfile implements AuthEvent {
  const _UpdateProfile({required this.user});

  final UserModel user;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateProfileCopyWith<_UpdateProfile> get copyWith =>
      __$UpdateProfileCopyWithImpl<_UpdateProfile>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateProfile &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString() {
    return 'AuthEvent.updateProfile(user: $user)';
  }
}

/// @nodoc
abstract mixin class _$UpdateProfileCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$UpdateProfileCopyWith(
          _UpdateProfile value, $Res Function(_UpdateProfile) _then) =
      __$UpdateProfileCopyWithImpl;
  @useResult
  $Res call({UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$UpdateProfileCopyWithImpl<$Res>
    implements _$UpdateProfileCopyWith<$Res> {
  __$UpdateProfileCopyWithImpl(this._self, this._then);

  final _UpdateProfile _self;
  final $Res Function(_UpdateProfile) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
  }) {
    return _then(_UpdateProfile(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc

class _ResetPassword implements AuthEvent {
  const _ResetPassword({required this.email});

  final String email;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResetPasswordCopyWith<_ResetPassword> get copyWith =>
      __$ResetPasswordCopyWithImpl<_ResetPassword>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResetPassword &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'AuthEvent.resetPassword(email: $email)';
  }
}

/// @nodoc
abstract mixin class _$ResetPasswordCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$ResetPasswordCopyWith(
          _ResetPassword value, $Res Function(_ResetPassword) _then) =
      __$ResetPasswordCopyWithImpl;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$ResetPasswordCopyWithImpl<$Res>
    implements _$ResetPasswordCopyWith<$Res> {
  __$ResetPasswordCopyWithImpl(this._self, this._then);

  final _ResetPassword _self;
  final $Res Function(_ResetPassword) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
  }) {
    return _then(_ResetPassword(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _AuthError implements AuthEvent {
  const _AuthError({required this.message});

  final String message;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthErrorCopyWith<_AuthError> get copyWith =>
      __$AuthErrorCopyWithImpl<_AuthError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'AuthEvent.authError(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$AuthErrorCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$AuthErrorCopyWith(
          _AuthError value, $Res Function(_AuthError) _then) =
      __$AuthErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$AuthErrorCopyWithImpl<$Res> implements _$AuthErrorCopyWith<$Res> {
  __$AuthErrorCopyWithImpl(this._self, this._then);

  final _AuthError _self;
  final $Res Function(_AuthError) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_AuthError(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Loading implements AuthEvent {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.loading()';
  }
}

/// @nodoc

class _Authenticated implements AuthEvent {
  const _Authenticated({required this.user, required this.token});

  final UserModel user;
  final String token;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthenticatedCopyWith<_Authenticated> get copyWith =>
      __$AuthenticatedCopyWithImpl<_Authenticated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Authenticated &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, token);

  @override
  String toString() {
    return 'AuthEvent.authenticated(user: $user, token: $token)';
  }
}

/// @nodoc
abstract mixin class _$AuthenticatedCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$AuthenticatedCopyWith(
          _Authenticated value, $Res Function(_Authenticated) _then) =
      __$AuthenticatedCopyWithImpl;
  @useResult
  $Res call({UserModel user, String token});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$AuthenticatedCopyWithImpl<$Res>
    implements _$AuthenticatedCopyWith<$Res> {
  __$AuthenticatedCopyWithImpl(this._self, this._then);

  final _Authenticated _self;
  final $Res Function(_Authenticated) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
    Object? token = null,
  }) {
    return _then(_Authenticated(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc

class _Unauthenticated implements AuthEvent {
  const _Unauthenticated();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.unauthenticated()';
  }
}

/// @nodoc
mixin _$AuthState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState()';
  }
}

/// @nodoc
class $AuthStateCopyWith<$Res> {
  $AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}

/// @nodoc

class Initial implements AuthState {
  const Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.initial()';
  }
}

/// @nodoc

class Loading implements AuthState {
  const Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.loading()';
  }
}

/// @nodoc

class Authenticated implements AuthState {
  const Authenticated({required this.user, required this.token});

  final UserModel user;
  final String token;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthenticatedCopyWith<Authenticated> get copyWith =>
      _$AuthenticatedCopyWithImpl<Authenticated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Authenticated &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, token);

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user, token: $token)';
  }
}

/// @nodoc
abstract mixin class $AuthenticatedCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory $AuthenticatedCopyWith(
          Authenticated value, $Res Function(Authenticated) _then) =
      _$AuthenticatedCopyWithImpl;
  @useResult
  $Res call({UserModel user, String token});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$AuthenticatedCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(this._self, this._then);

  final Authenticated _self;
  final $Res Function(Authenticated) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
    Object? token = null,
  }) {
    return _then(Authenticated(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc

class Unauthenticated implements AuthState {
  const Unauthenticated();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }
}

/// @nodoc

class Error implements AuthState {
  const Error({required this.message});

  final String message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'AuthState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) =
      _$ErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(Error(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class PasswordResetSent implements AuthState {
  const PasswordResetSent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PasswordResetSent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.passwordResetSent()';
  }
}

// dart format on
