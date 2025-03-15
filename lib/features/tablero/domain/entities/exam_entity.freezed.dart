// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExamEntity {
  String get id;
  String get courseId;
  String get subject;
  int get chapterNumber;
  int get pageNumber;
  int get questionCount;
  String get time;
  ExamStatus get status;

  /// Create a copy of ExamEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExamEntityCopyWith<ExamEntity> get copyWith =>
      _$ExamEntityCopyWithImpl<ExamEntity>(this as ExamEntity, _$identity);

  /// Serializes this ExamEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExamEntity &&
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
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, courseId, subject,
      chapterNumber, pageNumber, questionCount, time, status);

  @override
  String toString() {
    return 'ExamEntity(id: $id, courseId: $courseId, subject: $subject, chapterNumber: $chapterNumber, pageNumber: $pageNumber, questionCount: $questionCount, time: $time, status: $status)';
  }
}

/// @nodoc
abstract mixin class $ExamEntityCopyWith<$Res> {
  factory $ExamEntityCopyWith(
          ExamEntity value, $Res Function(ExamEntity) _then) =
      _$ExamEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String courseId,
      String subject,
      int chapterNumber,
      int pageNumber,
      int questionCount,
      String time,
      ExamStatus status});
}

/// @nodoc
class _$ExamEntityCopyWithImpl<$Res> implements $ExamEntityCopyWith<$Res> {
  _$ExamEntityCopyWithImpl(this._self, this._then);

  final ExamEntity _self;
  final $Res Function(ExamEntity) _then;

  /// Create a copy of ExamEntity
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ExamEntity implements ExamEntity {
  const _ExamEntity(
      {required this.id,
      required this.courseId,
      required this.subject,
      required this.chapterNumber,
      required this.pageNumber,
      required this.questionCount,
      required this.time,
      required this.status});
  factory _ExamEntity.fromJson(Map<String, dynamic> json) =>
      _$ExamEntityFromJson(json);

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

  /// Create a copy of ExamEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExamEntityCopyWith<_ExamEntity> get copyWith =>
      __$ExamEntityCopyWithImpl<_ExamEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExamEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExamEntity &&
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
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, courseId, subject,
      chapterNumber, pageNumber, questionCount, time, status);

  @override
  String toString() {
    return 'ExamEntity(id: $id, courseId: $courseId, subject: $subject, chapterNumber: $chapterNumber, pageNumber: $pageNumber, questionCount: $questionCount, time: $time, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$ExamEntityCopyWith<$Res>
    implements $ExamEntityCopyWith<$Res> {
  factory _$ExamEntityCopyWith(
          _ExamEntity value, $Res Function(_ExamEntity) _then) =
      __$ExamEntityCopyWithImpl;
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
      ExamStatus status});
}

/// @nodoc
class __$ExamEntityCopyWithImpl<$Res> implements _$ExamEntityCopyWith<$Res> {
  __$ExamEntityCopyWithImpl(this._self, this._then);

  final _ExamEntity _self;
  final $Res Function(_ExamEntity) _then;

  /// Create a copy of ExamEntity
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
  }) {
    return _then(_ExamEntity(
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
    ));
  }
}

// dart format on
