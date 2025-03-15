// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leader_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaderModel {
  String get id;
  String get name;
  String get photoUrl;
  int get score;

  /// Create a copy of LeaderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LeaderModelCopyWith<LeaderModel> get copyWith =>
      _$LeaderModelCopyWithImpl<LeaderModel>(this as LeaderModel, _$identity);

  /// Serializes this LeaderModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LeaderModel &&
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
    return 'LeaderModel(id: $id, name: $name, photoUrl: $photoUrl, score: $score)';
  }
}

/// @nodoc
abstract mixin class $LeaderModelCopyWith<$Res> {
  factory $LeaderModelCopyWith(
          LeaderModel value, $Res Function(LeaderModel) _then) =
      _$LeaderModelCopyWithImpl;
  @useResult
  $Res call({String id, String name, String photoUrl, int score});
}

/// @nodoc
class _$LeaderModelCopyWithImpl<$Res> implements $LeaderModelCopyWith<$Res> {
  _$LeaderModelCopyWithImpl(this._self, this._then);

  final LeaderModel _self;
  final $Res Function(LeaderModel) _then;

  /// Create a copy of LeaderModel
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
class _LeaderModel implements LeaderModel {
  const _LeaderModel(
      {required this.id,
      required this.name,
      required this.photoUrl,
      required this.score});
  factory _LeaderModel.fromJson(Map<String, dynamic> json) =>
      _$LeaderModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String photoUrl;
  @override
  final int score;

  /// Create a copy of LeaderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LeaderModelCopyWith<_LeaderModel> get copyWith =>
      __$LeaderModelCopyWithImpl<_LeaderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LeaderModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LeaderModel &&
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
    return 'LeaderModel(id: $id, name: $name, photoUrl: $photoUrl, score: $score)';
  }
}

/// @nodoc
abstract mixin class _$LeaderModelCopyWith<$Res>
    implements $LeaderModelCopyWith<$Res> {
  factory _$LeaderModelCopyWith(
          _LeaderModel value, $Res Function(_LeaderModel) _then) =
      __$LeaderModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, String photoUrl, int score});
}

/// @nodoc
class __$LeaderModelCopyWithImpl<$Res> implements _$LeaderModelCopyWith<$Res> {
  __$LeaderModelCopyWithImpl(this._self, this._then);

  final _LeaderModel _self;
  final $Res Function(_LeaderModel) _then;

  /// Create a copy of LeaderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? photoUrl = null,
    Object? score = null,
  }) {
    return _then(_LeaderModel(
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
