// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_progress_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CourseProgressEntity {
  String get id;
  String get courseId;
  String get chapterName;
  int get chapterNumber;
  double get progressPercentage;

  /// Create a copy of CourseProgressEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseProgressEntityCopyWith<CourseProgressEntity> get copyWith =>
      _$CourseProgressEntityCopyWithImpl<CourseProgressEntity>(
          this as CourseProgressEntity, _$identity);

  /// Serializes this CourseProgressEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseProgressEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.chapterName, chapterName) ||
                other.chapterName == chapterName) &&
            (identical(other.chapterNumber, chapterNumber) ||
                other.chapterNumber == chapterNumber) &&
            (identical(other.progressPercentage, progressPercentage) ||
                other.progressPercentage == progressPercentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, courseId, chapterName,
      chapterNumber, progressPercentage);

  @override
  String toString() {
    return 'CourseProgressEntity(id: $id, courseId: $courseId, chapterName: $chapterName, chapterNumber: $chapterNumber, progressPercentage: $progressPercentage)';
  }
}

/// @nodoc
abstract mixin class $CourseProgressEntityCopyWith<$Res> {
  factory $CourseProgressEntityCopyWith(CourseProgressEntity value,
          $Res Function(CourseProgressEntity) _then) =
      _$CourseProgressEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String courseId,
      String chapterName,
      int chapterNumber,
      double progressPercentage});
}

/// @nodoc
class _$CourseProgressEntityCopyWithImpl<$Res>
    implements $CourseProgressEntityCopyWith<$Res> {
  _$CourseProgressEntityCopyWithImpl(this._self, this._then);

  final CourseProgressEntity _self;
  final $Res Function(CourseProgressEntity) _then;

  /// Create a copy of CourseProgressEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? chapterName = null,
    Object? chapterNumber = null,
    Object? progressPercentage = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: null == courseId
          ? _self.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      chapterName: null == chapterName
          ? _self.chapterName
          : chapterName // ignore: cast_nullable_to_non_nullable
              as String,
      chapterNumber: null == chapterNumber
          ? _self.chapterNumber
          : chapterNumber // ignore: cast_nullable_to_non_nullable
              as int,
      progressPercentage: null == progressPercentage
          ? _self.progressPercentage
          : progressPercentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CourseProgressEntity implements CourseProgressEntity {
  const _CourseProgressEntity(
      {required this.id,
      required this.courseId,
      required this.chapterName,
      required this.chapterNumber,
      required this.progressPercentage});
  factory _CourseProgressEntity.fromJson(Map<String, dynamic> json) =>
      _$CourseProgressEntityFromJson(json);

  @override
  final String id;
  @override
  final String courseId;
  @override
  final String chapterName;
  @override
  final int chapterNumber;
  @override
  final double progressPercentage;

  /// Create a copy of CourseProgressEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CourseProgressEntityCopyWith<_CourseProgressEntity> get copyWith =>
      __$CourseProgressEntityCopyWithImpl<_CourseProgressEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CourseProgressEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseProgressEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.chapterName, chapterName) ||
                other.chapterName == chapterName) &&
            (identical(other.chapterNumber, chapterNumber) ||
                other.chapterNumber == chapterNumber) &&
            (identical(other.progressPercentage, progressPercentage) ||
                other.progressPercentage == progressPercentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, courseId, chapterName,
      chapterNumber, progressPercentage);

  @override
  String toString() {
    return 'CourseProgressEntity(id: $id, courseId: $courseId, chapterName: $chapterName, chapterNumber: $chapterNumber, progressPercentage: $progressPercentage)';
  }
}

/// @nodoc
abstract mixin class _$CourseProgressEntityCopyWith<$Res>
    implements $CourseProgressEntityCopyWith<$Res> {
  factory _$CourseProgressEntityCopyWith(_CourseProgressEntity value,
          $Res Function(_CourseProgressEntity) _then) =
      __$CourseProgressEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String courseId,
      String chapterName,
      int chapterNumber,
      double progressPercentage});
}

/// @nodoc
class __$CourseProgressEntityCopyWithImpl<$Res>
    implements _$CourseProgressEntityCopyWith<$Res> {
  __$CourseProgressEntityCopyWithImpl(this._self, this._then);

  final _CourseProgressEntity _self;
  final $Res Function(_CourseProgressEntity) _then;

  /// Create a copy of CourseProgressEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? chapterName = null,
    Object? chapterNumber = null,
    Object? progressPercentage = null,
  }) {
    return _then(_CourseProgressEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: null == courseId
          ? _self.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      chapterName: null == chapterName
          ? _self.chapterName
          : chapterName // ignore: cast_nullable_to_non_nullable
              as String,
      chapterNumber: null == chapterNumber
          ? _self.chapterNumber
          : chapterNumber // ignore: cast_nullable_to_non_nullable
              as int,
      progressPercentage: null == progressPercentage
          ? _self.progressPercentage
          : progressPercentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
