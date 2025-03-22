// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Test {
  String get id;
  String get title;
  String get courseId;
  String get unitId;
  int get questionCount;
  int get timeLimit;
  String get description;
  bool get hasAttempted;
  bool get isPassed;
  double get lastScore;

  /// Create a copy of Test
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TestCopyWith<Test> get copyWith =>
      _$TestCopyWithImpl<Test>(this as Test, _$identity);

  /// Serializes this Test to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Test &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.questionCount, questionCount) ||
                other.questionCount == questionCount) &&
            (identical(other.timeLimit, timeLimit) ||
                other.timeLimit == timeLimit) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.hasAttempted, hasAttempted) ||
                other.hasAttempted == hasAttempted) &&
            (identical(other.isPassed, isPassed) ||
                other.isPassed == isPassed) &&
            (identical(other.lastScore, lastScore) ||
                other.lastScore == lastScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, courseId, unitId,
      questionCount, timeLimit, description, hasAttempted, isPassed, lastScore);

  @override
  String toString() {
    return 'Test(id: $id, title: $title, courseId: $courseId, unitId: $unitId, questionCount: $questionCount, timeLimit: $timeLimit, description: $description, hasAttempted: $hasAttempted, isPassed: $isPassed, lastScore: $lastScore)';
  }
}

/// @nodoc
abstract mixin class $TestCopyWith<$Res> {
  factory $TestCopyWith(Test value, $Res Function(Test) _then) =
      _$TestCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String courseId,
      String unitId,
      int questionCount,
      int timeLimit,
      String description,
      bool hasAttempted,
      bool isPassed,
      double lastScore});
}

/// @nodoc
class _$TestCopyWithImpl<$Res> implements $TestCopyWith<$Res> {
  _$TestCopyWithImpl(this._self, this._then);

  final Test _self;
  final $Res Function(Test) _then;

  /// Create a copy of Test
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? courseId = null,
    Object? unitId = null,
    Object? questionCount = null,
    Object? timeLimit = null,
    Object? description = null,
    Object? hasAttempted = null,
    Object? isPassed = null,
    Object? lastScore = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: null == courseId
          ? _self.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _self.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      questionCount: null == questionCount
          ? _self.questionCount
          : questionCount // ignore: cast_nullable_to_non_nullable
              as int,
      timeLimit: null == timeLimit
          ? _self.timeLimit
          : timeLimit // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      hasAttempted: null == hasAttempted
          ? _self.hasAttempted
          : hasAttempted // ignore: cast_nullable_to_non_nullable
              as bool,
      isPassed: null == isPassed
          ? _self.isPassed
          : isPassed // ignore: cast_nullable_to_non_nullable
              as bool,
      lastScore: null == lastScore
          ? _self.lastScore
          : lastScore // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Test implements Test {
  const _Test(
      {required this.id,
      required this.title,
      required this.courseId,
      required this.unitId,
      required this.questionCount,
      this.timeLimit = 30,
      this.description = '',
      this.hasAttempted = false,
      this.isPassed = false,
      this.lastScore = 0.0});
  factory _Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String courseId;
  @override
  final String unitId;
  @override
  final int questionCount;
  @override
  @JsonKey()
  final int timeLimit;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final bool hasAttempted;
  @override
  @JsonKey()
  final bool isPassed;
  @override
  @JsonKey()
  final double lastScore;

  /// Create a copy of Test
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TestCopyWith<_Test> get copyWith =>
      __$TestCopyWithImpl<_Test>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Test &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.questionCount, questionCount) ||
                other.questionCount == questionCount) &&
            (identical(other.timeLimit, timeLimit) ||
                other.timeLimit == timeLimit) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.hasAttempted, hasAttempted) ||
                other.hasAttempted == hasAttempted) &&
            (identical(other.isPassed, isPassed) ||
                other.isPassed == isPassed) &&
            (identical(other.lastScore, lastScore) ||
                other.lastScore == lastScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, courseId, unitId,
      questionCount, timeLimit, description, hasAttempted, isPassed, lastScore);

  @override
  String toString() {
    return 'Test(id: $id, title: $title, courseId: $courseId, unitId: $unitId, questionCount: $questionCount, timeLimit: $timeLimit, description: $description, hasAttempted: $hasAttempted, isPassed: $isPassed, lastScore: $lastScore)';
  }
}

/// @nodoc
abstract mixin class _$TestCopyWith<$Res> implements $TestCopyWith<$Res> {
  factory _$TestCopyWith(_Test value, $Res Function(_Test) _then) =
      __$TestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String courseId,
      String unitId,
      int questionCount,
      int timeLimit,
      String description,
      bool hasAttempted,
      bool isPassed,
      double lastScore});
}

/// @nodoc
class __$TestCopyWithImpl<$Res> implements _$TestCopyWith<$Res> {
  __$TestCopyWithImpl(this._self, this._then);

  final _Test _self;
  final $Res Function(_Test) _then;

  /// Create a copy of Test
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? courseId = null,
    Object? unitId = null,
    Object? questionCount = null,
    Object? timeLimit = null,
    Object? description = null,
    Object? hasAttempted = null,
    Object? isPassed = null,
    Object? lastScore = null,
  }) {
    return _then(_Test(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: null == courseId
          ? _self.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _self.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      questionCount: null == questionCount
          ? _self.questionCount
          : questionCount // ignore: cast_nullable_to_non_nullable
              as int,
      timeLimit: null == timeLimit
          ? _self.timeLimit
          : timeLimit // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      hasAttempted: null == hasAttempted
          ? _self.hasAttempted
          : hasAttempted // ignore: cast_nullable_to_non_nullable
              as bool,
      isPassed: null == isPassed
          ? _self.isPassed
          : isPassed // ignore: cast_nullable_to_non_nullable
              as bool,
      lastScore: null == lastScore
          ? _self.lastScore
          : lastScore // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
