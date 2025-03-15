// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tablero_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TableroEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TableroEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TableroEvent()';
  }
}

/// @nodoc
class $TableroEventCopyWith<$Res> {
  $TableroEventCopyWith(TableroEvent _, $Res Function(TableroEvent) __);
}

/// @nodoc

class _Started implements TableroEvent {
  const _Started();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TableroEvent.started()';
  }
}

/// @nodoc

class _UpdateCourseProgress implements TableroEvent {
  const _UpdateCourseProgress(
      {required this.progressId, required this.completed});

  final String progressId;
  final bool completed;

  /// Create a copy of TableroEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateCourseProgressCopyWith<_UpdateCourseProgress> get copyWith =>
      __$UpdateCourseProgressCopyWithImpl<_UpdateCourseProgress>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateCourseProgress &&
            (identical(other.progressId, progressId) ||
                other.progressId == progressId) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progressId, completed);

  @override
  String toString() {
    return 'TableroEvent.updateCourseProgress(progressId: $progressId, completed: $completed)';
  }
}

/// @nodoc
abstract mixin class _$UpdateCourseProgressCopyWith<$Res>
    implements $TableroEventCopyWith<$Res> {
  factory _$UpdateCourseProgressCopyWith(_UpdateCourseProgress value,
          $Res Function(_UpdateCourseProgress) _then) =
      __$UpdateCourseProgressCopyWithImpl;
  @useResult
  $Res call({String progressId, bool completed});
}

/// @nodoc
class __$UpdateCourseProgressCopyWithImpl<$Res>
    implements _$UpdateCourseProgressCopyWith<$Res> {
  __$UpdateCourseProgressCopyWithImpl(this._self, this._then);

  final _UpdateCourseProgress _self;
  final $Res Function(_UpdateCourseProgress) _then;

  /// Create a copy of TableroEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? progressId = null,
    Object? completed = null,
  }) {
    return _then(_UpdateCourseProgress(
      progressId: null == progressId
          ? _self.progressId
          : progressId // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _self.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$TableroState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TableroState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TableroState()';
  }
}

/// @nodoc
class $TableroStateCopyWith<$Res> {
  $TableroStateCopyWith(TableroState _, $Res Function(TableroState) __);
}

/// @nodoc

class Initial implements TableroState {
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
    return 'TableroState.initial()';
  }
}

/// @nodoc

class Loading implements TableroState {
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
    return 'TableroState.loading()';
  }
}

/// @nodoc

class Loaded implements TableroState {
  const Loaded(
      {required final List<LeaderEntity> leaders,
      required final List<CourseProgressEntity> courseProgress,
      required final List<ExamEntity> exams,
      required this.userProfile,
      required this.announcement})
      : _leaders = leaders,
        _courseProgress = courseProgress,
        _exams = exams;

  final List<LeaderEntity> _leaders;
  List<LeaderEntity> get leaders {
    if (_leaders is EqualUnmodifiableListView) return _leaders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_leaders);
  }

  final List<CourseProgressEntity> _courseProgress;
  List<CourseProgressEntity> get courseProgress {
    if (_courseProgress is EqualUnmodifiableListView) return _courseProgress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courseProgress);
  }

  final List<ExamEntity> _exams;
  List<ExamEntity> get exams {
    if (_exams is EqualUnmodifiableListView) return _exams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exams);
  }

  final UserProfileEntity userProfile;
  final String announcement;

  /// Create a copy of TableroState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Loaded &&
            const DeepCollectionEquality().equals(other._leaders, _leaders) &&
            const DeepCollectionEquality()
                .equals(other._courseProgress, _courseProgress) &&
            const DeepCollectionEquality().equals(other._exams, _exams) &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile) &&
            (identical(other.announcement, announcement) ||
                other.announcement == announcement));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_leaders),
      const DeepCollectionEquality().hash(_courseProgress),
      const DeepCollectionEquality().hash(_exams),
      userProfile,
      announcement);

  @override
  String toString() {
    return 'TableroState.loaded(leaders: $leaders, courseProgress: $courseProgress, exams: $exams, userProfile: $userProfile, announcement: $announcement)';
  }
}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res>
    implements $TableroStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) =
      _$LoadedCopyWithImpl;
  @useResult
  $Res call(
      {List<LeaderEntity> leaders,
      List<CourseProgressEntity> courseProgress,
      List<ExamEntity> exams,
      UserProfileEntity userProfile,
      String announcement});

  $UserProfileEntityCopyWith<$Res> get userProfile;
}

/// @nodoc
class _$LoadedCopyWithImpl<$Res> implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

  /// Create a copy of TableroState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? leaders = null,
    Object? courseProgress = null,
    Object? exams = null,
    Object? userProfile = null,
    Object? announcement = null,
  }) {
    return _then(Loaded(
      leaders: null == leaders
          ? _self._leaders
          : leaders // ignore: cast_nullable_to_non_nullable
              as List<LeaderEntity>,
      courseProgress: null == courseProgress
          ? _self._courseProgress
          : courseProgress // ignore: cast_nullable_to_non_nullable
              as List<CourseProgressEntity>,
      exams: null == exams
          ? _self._exams
          : exams // ignore: cast_nullable_to_non_nullable
              as List<ExamEntity>,
      userProfile: null == userProfile
          ? _self.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfileEntity,
      announcement: null == announcement
          ? _self.announcement
          : announcement // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of TableroState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileEntityCopyWith<$Res> get userProfile {
    return $UserProfileEntityCopyWith<$Res>(_self.userProfile, (value) {
      return _then(_self.copyWith(userProfile: value));
    });
  }
}

/// @nodoc

class Error implements TableroState {
  const Error({required this.message});

  final String message;

  /// Create a copy of TableroState
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
    return 'TableroState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res>
    implements $TableroStateCopyWith<$Res> {
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

  /// Create a copy of TableroState
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

// dart format on
