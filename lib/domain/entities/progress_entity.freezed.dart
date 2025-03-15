// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgressEntity {
  String get courseId;
  String get courseName;
  int get chapterNumber;
  String get chapterName;
  double get progressPercentage;

  /// Create a copy of ProgressEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProgressEntityCopyWith<ProgressEntity> get copyWith =>
      _$ProgressEntityCopyWithImpl<ProgressEntity>(
          this as ProgressEntity, _$identity);

  /// Serializes this ProgressEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProgressEntity &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.chapterNumber, chapterNumber) ||
                other.chapterNumber == chapterNumber) &&
            (identical(other.chapterName, chapterName) ||
                other.chapterName == chapterName) &&
            (identical(other.progressPercentage, progressPercentage) ||
                other.progressPercentage == progressPercentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, courseId, courseName,
      chapterNumber, chapterName, progressPercentage);

  @override
  String toString() {
    return 'ProgressEntity(courseId: $courseId, courseName: $courseName, chapterNumber: $chapterNumber, chapterName: $chapterName, progressPercentage: $progressPercentage)';
  }
}

/// @nodoc
abstract mixin class $ProgressEntityCopyWith<$Res> {
  factory $ProgressEntityCopyWith(
          ProgressEntity value, $Res Function(ProgressEntity) _then) =
      _$ProgressEntityCopyWithImpl;
  @useResult
  $Res call(
      {String courseId,
      String courseName,
      int chapterNumber,
      String chapterName,
      double progressPercentage});
}

/// @nodoc
class _$ProgressEntityCopyWithImpl<$Res>
    implements $ProgressEntityCopyWith<$Res> {
  _$ProgressEntityCopyWithImpl(this._self, this._then);

  final ProgressEntity _self;
  final $Res Function(ProgressEntity) _then;

  /// Create a copy of ProgressEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? courseId = null,
    Object? courseName = null,
    Object? chapterNumber = null,
    Object? chapterName = null,
    Object? progressPercentage = null,
  }) {
    return _then(_self.copyWith(
      courseId: null == courseId
          ? _self.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      courseName: null == courseName
          ? _self.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String,
      chapterNumber: null == chapterNumber
          ? _self.chapterNumber
          : chapterNumber // ignore: cast_nullable_to_non_nullable
              as int,
      chapterName: null == chapterName
          ? _self.chapterName
          : chapterName // ignore: cast_nullable_to_non_nullable
              as String,
      progressPercentage: null == progressPercentage
          ? _self.progressPercentage
          : progressPercentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProgressEntity implements ProgressEntity {
  const _ProgressEntity(
      {required this.courseId,
      required this.courseName,
      required this.chapterNumber,
      required this.chapterName,
      required this.progressPercentage});
  factory _ProgressEntity.fromJson(Map<String, dynamic> json) =>
      _$ProgressEntityFromJson(json);

  @override
  final String courseId;
  @override
  final String courseName;
  @override
  final int chapterNumber;
  @override
  final String chapterName;
  @override
  final double progressPercentage;

  /// Create a copy of ProgressEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProgressEntityCopyWith<_ProgressEntity> get copyWith =>
      __$ProgressEntityCopyWithImpl<_ProgressEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProgressEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProgressEntity &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.chapterNumber, chapterNumber) ||
                other.chapterNumber == chapterNumber) &&
            (identical(other.chapterName, chapterName) ||
                other.chapterName == chapterName) &&
            (identical(other.progressPercentage, progressPercentage) ||
                other.progressPercentage == progressPercentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, courseId, courseName,
      chapterNumber, chapterName, progressPercentage);

  @override
  String toString() {
    return 'ProgressEntity(courseId: $courseId, courseName: $courseName, chapterNumber: $chapterNumber, chapterName: $chapterName, progressPercentage: $progressPercentage)';
  }
}

/// @nodoc
abstract mixin class _$ProgressEntityCopyWith<$Res>
    implements $ProgressEntityCopyWith<$Res> {
  factory _$ProgressEntityCopyWith(
          _ProgressEntity value, $Res Function(_ProgressEntity) _then) =
      __$ProgressEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String courseId,
      String courseName,
      int chapterNumber,
      String chapterName,
      double progressPercentage});
}

/// @nodoc
class __$ProgressEntityCopyWithImpl<$Res>
    implements _$ProgressEntityCopyWith<$Res> {
  __$ProgressEntityCopyWithImpl(this._self, this._then);

  final _ProgressEntity _self;
  final $Res Function(_ProgressEntity) _then;

  /// Create a copy of ProgressEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? courseId = null,
    Object? courseName = null,
    Object? chapterNumber = null,
    Object? chapterName = null,
    Object? progressPercentage = null,
  }) {
    return _then(_ProgressEntity(
      courseId: null == courseId
          ? _self.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      courseName: null == courseName
          ? _self.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String,
      chapterNumber: null == chapterNumber
          ? _self.chapterNumber
          : chapterNumber // ignore: cast_nullable_to_non_nullable
              as int,
      chapterName: null == chapterName
          ? _self.chapterName
          : chapterName // ignore: cast_nullable_to_non_nullable
              as String,
      progressPercentage: null == progressPercentage
          ? _self.progressPercentage
          : progressPercentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
