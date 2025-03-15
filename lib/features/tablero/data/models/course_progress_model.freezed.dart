// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_progress_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CourseProgressModel {
  String get id;
  String get courseId;
  String get chapterName;
  int get chapterNumber;
  double get progressPercentage;
  String get userId;

  /// Create a copy of CourseProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseProgressModelCopyWith<CourseProgressModel> get copyWith =>
      _$CourseProgressModelCopyWithImpl<CourseProgressModel>(
          this as CourseProgressModel, _$identity);

  /// Serializes this CourseProgressModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseProgressModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.chapterName, chapterName) ||
                other.chapterName == chapterName) &&
            (identical(other.chapterNumber, chapterNumber) ||
                other.chapterNumber == chapterNumber) &&
            (identical(other.progressPercentage, progressPercentage) ||
                other.progressPercentage == progressPercentage) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, courseId, chapterName,
      chapterNumber, progressPercentage, userId);

  @override
  String toString() {
    return 'CourseProgressModel(id: $id, courseId: $courseId, chapterName: $chapterName, chapterNumber: $chapterNumber, progressPercentage: $progressPercentage, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $CourseProgressModelCopyWith<$Res> {
  factory $CourseProgressModelCopyWith(
          CourseProgressModel value, $Res Function(CourseProgressModel) _then) =
      _$CourseProgressModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String courseId,
      String chapterName,
      int chapterNumber,
      double progressPercentage,
      String userId});
}

/// @nodoc
class _$CourseProgressModelCopyWithImpl<$Res>
    implements $CourseProgressModelCopyWith<$Res> {
  _$CourseProgressModelCopyWithImpl(this._self, this._then);

  final CourseProgressModel _self;
  final $Res Function(CourseProgressModel) _then;

  /// Create a copy of CourseProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? chapterName = null,
    Object? chapterNumber = null,
    Object? progressPercentage = null,
    Object? userId = null,
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
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CourseProgressModel implements CourseProgressModel {
  const _CourseProgressModel(
      {required this.id,
      required this.courseId,
      required this.chapterName,
      required this.chapterNumber,
      required this.progressPercentage,
      required this.userId});
  factory _CourseProgressModel.fromJson(Map<String, dynamic> json) =>
      _$CourseProgressModelFromJson(json);

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
  @override
  final String userId;

  /// Create a copy of CourseProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CourseProgressModelCopyWith<_CourseProgressModel> get copyWith =>
      __$CourseProgressModelCopyWithImpl<_CourseProgressModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CourseProgressModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseProgressModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.chapterName, chapterName) ||
                other.chapterName == chapterName) &&
            (identical(other.chapterNumber, chapterNumber) ||
                other.chapterNumber == chapterNumber) &&
            (identical(other.progressPercentage, progressPercentage) ||
                other.progressPercentage == progressPercentage) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, courseId, chapterName,
      chapterNumber, progressPercentage, userId);

  @override
  String toString() {
    return 'CourseProgressModel(id: $id, courseId: $courseId, chapterName: $chapterName, chapterNumber: $chapterNumber, progressPercentage: $progressPercentage, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class _$CourseProgressModelCopyWith<$Res>
    implements $CourseProgressModelCopyWith<$Res> {
  factory _$CourseProgressModelCopyWith(_CourseProgressModel value,
          $Res Function(_CourseProgressModel) _then) =
      __$CourseProgressModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String courseId,
      String chapterName,
      int chapterNumber,
      double progressPercentage,
      String userId});
}

/// @nodoc
class __$CourseProgressModelCopyWithImpl<$Res>
    implements _$CourseProgressModelCopyWith<$Res> {
  __$CourseProgressModelCopyWithImpl(this._self, this._then);

  final _CourseProgressModel _self;
  final $Res Function(_CourseProgressModel) _then;

  /// Create a copy of CourseProgressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? chapterName = null,
    Object? chapterNumber = null,
    Object? progressPercentage = null,
    Object? userId = null,
  }) {
    return _then(_CourseProgressModel(
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
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
