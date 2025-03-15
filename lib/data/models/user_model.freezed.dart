// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {
  String get id;
  String get user;
  String get nombre;
  String get apellido;
  String get correo;
  String get telefono;
  String get curp;
  String get escuela;
  String get grado;
  String? get fotoUrl;
  String get rol;
  Map<String, bool> get permisos;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<UserModel> get copyWith =>
      _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.apellido, apellido) ||
                other.apellido == apellido) &&
            (identical(other.correo, correo) || other.correo == correo) &&
            (identical(other.telefono, telefono) ||
                other.telefono == telefono) &&
            (identical(other.curp, curp) || other.curp == curp) &&
            (identical(other.escuela, escuela) || other.escuela == escuela) &&
            (identical(other.grado, grado) || other.grado == grado) &&
            (identical(other.fotoUrl, fotoUrl) || other.fotoUrl == fotoUrl) &&
            (identical(other.rol, rol) || other.rol == rol) &&
            const DeepCollectionEquality().equals(other.permisos, permisos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      user,
      nombre,
      apellido,
      correo,
      telefono,
      curp,
      escuela,
      grado,
      fotoUrl,
      rol,
      const DeepCollectionEquality().hash(permisos));

  @override
  String toString() {
    return 'UserModel(id: $id, user: $user, nombre: $nombre, apellido: $apellido, correo: $correo, telefono: $telefono, curp: $curp, escuela: $escuela, grado: $grado, fotoUrl: $fotoUrl, rol: $rol, permisos: $permisos)';
  }
}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) =
      _$UserModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String user,
      String nombre,
      String apellido,
      String correo,
      String telefono,
      String curp,
      String escuela,
      String grado,
      String? fotoUrl,
      String rol,
      Map<String, bool> permisos});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? nombre = null,
    Object? apellido = null,
    Object? correo = null,
    Object? telefono = null,
    Object? curp = null,
    Object? escuela = null,
    Object? grado = null,
    Object? fotoUrl = freezed,
    Object? rol = null,
    Object? permisos = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: null == nombre
          ? _self.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      apellido: null == apellido
          ? _self.apellido
          : apellido // ignore: cast_nullable_to_non_nullable
              as String,
      correo: null == correo
          ? _self.correo
          : correo // ignore: cast_nullable_to_non_nullable
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
      fotoUrl: freezed == fotoUrl
          ? _self.fotoUrl
          : fotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rol: null == rol
          ? _self.rol
          : rol // ignore: cast_nullable_to_non_nullable
              as String,
      permisos: null == permisos
          ? _self.permisos
          : permisos // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserModel implements UserModel {
  _UserModel(
      {required this.id,
      required this.user,
      required this.nombre,
      required this.apellido,
      required this.correo,
      required this.telefono,
      required this.curp,
      required this.escuela,
      required this.grado,
      this.fotoUrl,
      this.rol = 'estudiante',
      final Map<String, bool> permisos = const {}})
      : _permisos = permisos;
  factory _UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  final String id;
  @override
  final String user;
  @override
  final String nombre;
  @override
  final String apellido;
  @override
  final String correo;
  @override
  final String telefono;
  @override
  final String curp;
  @override
  final String escuela;
  @override
  final String grado;
  @override
  final String? fotoUrl;
  @override
  @JsonKey()
  final String rol;
  final Map<String, bool> _permisos;
  @override
  @JsonKey()
  Map<String, bool> get permisos {
    if (_permisos is EqualUnmodifiableMapView) return _permisos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_permisos);
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.apellido, apellido) ||
                other.apellido == apellido) &&
            (identical(other.correo, correo) || other.correo == correo) &&
            (identical(other.telefono, telefono) ||
                other.telefono == telefono) &&
            (identical(other.curp, curp) || other.curp == curp) &&
            (identical(other.escuela, escuela) || other.escuela == escuela) &&
            (identical(other.grado, grado) || other.grado == grado) &&
            (identical(other.fotoUrl, fotoUrl) || other.fotoUrl == fotoUrl) &&
            (identical(other.rol, rol) || other.rol == rol) &&
            const DeepCollectionEquality().equals(other._permisos, _permisos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      user,
      nombre,
      apellido,
      correo,
      telefono,
      curp,
      escuela,
      grado,
      fotoUrl,
      rol,
      const DeepCollectionEquality().hash(_permisos));

  @override
  String toString() {
    return 'UserModel(id: $id, user: $user, nombre: $nombre, apellido: $apellido, correo: $correo, telefono: $telefono, curp: $curp, escuela: $escuela, grado: $grado, fotoUrl: $fotoUrl, rol: $rol, permisos: $permisos)';
  }
}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) _then) =
      __$UserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String user,
      String nombre,
      String apellido,
      String correo,
      String telefono,
      String curp,
      String escuela,
      String grado,
      String? fotoUrl,
      String rol,
      Map<String, bool> permisos});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? nombre = null,
    Object? apellido = null,
    Object? correo = null,
    Object? telefono = null,
    Object? curp = null,
    Object? escuela = null,
    Object? grado = null,
    Object? fotoUrl = freezed,
    Object? rol = null,
    Object? permisos = null,
  }) {
    return _then(_UserModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: null == nombre
          ? _self.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      apellido: null == apellido
          ? _self.apellido
          : apellido // ignore: cast_nullable_to_non_nullable
              as String,
      correo: null == correo
          ? _self.correo
          : correo // ignore: cast_nullable_to_non_nullable
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
      fotoUrl: freezed == fotoUrl
          ? _self.fotoUrl
          : fotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rol: null == rol
          ? _self.rol
          : rol // ignore: cast_nullable_to_non_nullable
              as String,
      permisos: null == permisos
          ? _self._permisos
          : permisos // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

// dart format on
