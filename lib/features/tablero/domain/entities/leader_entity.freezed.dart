// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leader_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaderEntity {
  String get id;
  String get name;
  String get photoUrl;
  int get score;

  /// Create a copy of LeaderEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LeaderEntityCopyWith<LeaderEntity> get copyWith =>
      _$LeaderEntityCopyWithImpl<LeaderEntity>(
          this as LeaderEntity, _$identity);

  /// Serializes this LeaderEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LeaderEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, photoUrl, score);

  @override
  String toString() {
    return 'LeaderEntity(id: $id, name: $name, photoUrl: $photoUrl, score: $score)';
  }
}

/// @nodoc
abstract mixin class $LeaderEntityCopyWith<$Res> {
  factory $LeaderEntityCopyWith(
          LeaderEntity value, $Res Function(LeaderEntity) _then) =
      _$LeaderEntityCopyWithImpl;
  @useResult
  $Res call({String id, String name, String photoUrl, int score});
}

/// @nodoc
class _$LeaderEntityCopyWithImpl<$Res> implements $LeaderEntityCopyWith<$Res> {
  _$LeaderEntityCopyWithImpl(this._self, this._then);

  final LeaderEntity _self;
  final $Res Function(LeaderEntity) _then;

  /// Create a copy of LeaderEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? photoUrl = null,
    Object? score = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LeaderEntity implements LeaderEntity {
  const _LeaderEntity(
      {required this.id,
      required this.name,
      required this.photoUrl,
      required this.score});
  factory _LeaderEntity.fromJson(Map<String, dynamic> json) =>
      _$LeaderEntityFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String photoUrl;
  @override
  final int score;

  /// Create a copy of LeaderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LeaderEntityCopyWith<_LeaderEntity> get copyWith =>
      __$LeaderEntityCopyWithImpl<_LeaderEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LeaderEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LeaderEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, photoUrl, score);

  @override
  String toString() {
    return 'LeaderEntity(id: $id, name: $name, photoUrl: $photoUrl, score: $score)';
  }
}

/// @nodoc
abstract mixin class _$LeaderEntityCopyWith<$Res>
    implements $LeaderEntityCopyWith<$Res> {
  factory _$LeaderEntityCopyWith(
          _LeaderEntity value, $Res Function(_LeaderEntity) _then) =
      __$LeaderEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, String photoUrl, int score});
}

/// @nodoc
class __$LeaderEntityCopyWithImpl<$Res>
    implements _$LeaderEntityCopyWith<$Res> {
  __$LeaderEntityCopyWithImpl(this._self, this._then);

  final _LeaderEntity _self;
  final $Res Function(_LeaderEntity) _then;

  /// Create a copy of LeaderEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? photoUrl = null,
    Object? score = null,
  }) {
    return _then(_LeaderEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
