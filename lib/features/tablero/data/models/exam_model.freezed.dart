// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExamModel {
  String get id;
  String get courseId;
  String get subject;
  int get chapterNumber;
  int get pageNumber;
  int get questionCount;
  String get time;
  ExamStatus get status;
  String get userId;

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExamModelCopyWith<ExamModel> get copyWith =>
      _$ExamModelCopyWithImpl<ExamModel>(this as ExamModel, _$identity);

  /// Serializes this ExamModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExamModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.chapterNumber, chapterNumber) ||
                other.chapterNumber == chapterNumber) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.questionCount, questionCount) ||
                other.questionCount == questionCount) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, courseId, subject,
      chapterNumber, pageNumber, questionCount, time, status, userId);

  @override
  String toString() {
    return 'ExamModel(id: $id, courseId: $courseId, subject: $subject, chapterNumber: $chapterNumber, pageNumber: $pageNumber, questionCount: $questionCount, time: $time, status: $status, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $ExamModelCopyWith<$Res> {
  factory $ExamModelCopyWith(ExamModel value, $Res Function(ExamModel) _then) =
      _$ExamModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String courseId,
      String subject,
      int chapterNumber,
      int pageNumber,
      int questionCount,
      String time,
      ExamStatus status,
      String userId});
}

/// @nodoc
class _$ExamModelCopyWithImpl<$Res> implements $ExamModelCopyWith<$Res> {
  _$ExamModelCopyWithImpl(this._self, this._then);

  final ExamModel _self;
  final $Res Function(ExamModel) _then;

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? subject = null,
    Object? chapterNumber = null,
    Object? pageNumber = null,
    Object? questionCount = null,
    Object? time = null,
    Object? status = null,
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
      subject: null == subject
          ? _self.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      chapterNumber: null == chapterNumber
          ? _self.chapterNumber
          : chapterNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _self.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      questionCount: null == questionCount
          ? _self.questionCount
          : questionCount // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ExamStatus,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ExamModel implements ExamModel {
  const _ExamModel(
      {required this.id,
      required this.courseId,
      required this.subject,
      required this.chapterNumber,
      required this.pageNumber,
      required this.questionCount,
      required this.time,
      required this.status,
      required this.userId});
  factory _ExamModel.fromJson(Map<String, dynamic> json) =>
      _$ExamModelFromJson(json);

  @override
  final String id;
  @override
  final String courseId;
  @override
  final String subject;
  @override
  final int chapterNumber;
  @override
  final int pageNumber;
  @override
  final int questionCount;
  @override
  final String time;
  @override
  final ExamStatus status;
  @override
  final String userId;

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExamModelCopyWith<_ExamModel> get copyWith =>
      __$ExamModelCopyWithImpl<_ExamModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExamModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExamModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.chapterNumber, chapterNumber) ||
                other.chapterNumber == chapterNumber) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.questionCount, questionCount) ||
                other.questionCount == questionCount) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, courseId, subject,
      chapterNumber, pageNumber, questionCount, time, status, userId);

  @override
  String toString() {
    return 'ExamModel(id: $id, courseId: $courseId, subject: $subject, chapterNumber: $chapterNumber, pageNumber: $pageNumber, questionCount: $questionCount, time: $time, status: $status, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class _$ExamModelCopyWith<$Res>
    implements $ExamModelCopyWith<$Res> {
  factory _$ExamModelCopyWith(
          _ExamModel value, $Res Function(_ExamModel) _then) =
      __$ExamModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String courseId,
      String subject,
      int chapterNumber,
      int pageNumber,
      int questionCount,
      String time,
      ExamStatus status,
      String userId});
}

/// @nodoc
class __$ExamModelCopyWithImpl<$Res> implements _$ExamModelCopyWith<$Res> {
  __$ExamModelCopyWithImpl(this._self, this._then);

  final _ExamModel _self;
  final $Res Function(_ExamModel) _then;

  /// Create a copy of ExamModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? subject = null,
    Object? chapterNumber = null,
    Object? pageNumber = null,
    Object? questionCount = null,
    Object? time = null,
    Object? status = null,
    Object? userId = null,
  }) {
    return _then(_ExamModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: null == courseId
          ? _self.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _self.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      chapterNumber: null == chapterNumber
          ? _self.chapterNumber
          : chapterNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _self.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      questionCount: null == questionCount
          ? _self.questionCount
          : questionCount // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as ExamStatus,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
