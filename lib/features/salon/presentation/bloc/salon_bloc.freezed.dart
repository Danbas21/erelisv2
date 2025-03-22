// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salon_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalonState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SalonState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SalonState()';
  }
}

/// @nodoc
class $SalonStateCopyWith<$Res> {
  $SalonStateCopyWith(SalonState _, $Res Function(SalonState) __);
}

/// @nodoc

class _SalonState implements SalonState {
  const _SalonState(
      {final List<SubjectModel> subjects = const [],
      this.isSidebarExpanded = true,
      this.isLoading = false,
      this.errorMessage})
      : _subjects = subjects;

  final List<SubjectModel> _subjects;
  @JsonKey()
  List<SubjectModel> get subjects {
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjects);
  }

  @JsonKey()
  final bool isSidebarExpanded;
  @JsonKey()
  final bool isLoading;
  final String? errorMessage;

  /// Create a copy of SalonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SalonStateCopyWith<_SalonState> get copyWith =>
      __$SalonStateCopyWithImpl<_SalonState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SalonState &&
            const DeepCollectionEquality().equals(other._subjects, _subjects) &&
            (identical(other.isSidebarExpanded, isSidebarExpanded) ||
                other.isSidebarExpanded == isSidebarExpanded) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_subjects),
      isSidebarExpanded,
      isLoading,
      errorMessage);

  @override
  String toString() {
    return 'SalonState(subjects: $subjects, isSidebarExpanded: $isSidebarExpanded, isLoading: $isLoading, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$SalonStateCopyWith<$Res>
    implements $SalonStateCopyWith<$Res> {
  factory _$SalonStateCopyWith(
          _SalonState value, $Res Function(_SalonState) _then) =
      __$SalonStateCopyWithImpl;
  @useResult
  $Res call(
      {List<SubjectModel> subjects,
      bool isSidebarExpanded,
      bool isLoading,
      String? errorMessage});
}

/// @nodoc
class __$SalonStateCopyWithImpl<$Res> implements _$SalonStateCopyWith<$Res> {
  __$SalonStateCopyWithImpl(this._self, this._then);

  final _SalonState _self;
  final $Res Function(_SalonState) _then;

  /// Create a copy of SalonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? subjects = null,
    Object? isSidebarExpanded = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_SalonState(
      subjects: null == subjects
          ? _self._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<SubjectModel>,
      isSidebarExpanded: null == isSidebarExpanded
          ? _self.isSidebarExpanded
          : isSidebarExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class Initial implements SalonState {
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
    return 'SalonState.initial()';
  }
}

/// @nodoc

class LoadInProgress implements SalonState {
  const LoadInProgress();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SalonState.loadInProgress()';
  }
}

/// @nodoc

class Loaded implements SalonState {
  const Loaded({required final List<SubjectModel> subject})
      : _subject = subject;

  final List<SubjectModel> _subject;
  List<SubjectModel> get subject {
    if (_subject is EqualUnmodifiableListView) return _subject;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subject);
  }

  /// Create a copy of SalonState
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
            const DeepCollectionEquality().equals(other._subject, _subject));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_subject));

  @override
  String toString() {
    return 'SalonState.loaded(subject: $subject)';
  }
}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res>
    implements $SalonStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) =
      _$LoadedCopyWithImpl;
  @useResult
  $Res call({List<SubjectModel> subject});
}

/// @nodoc
class _$LoadedCopyWithImpl<$Res> implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

  /// Create a copy of SalonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? subject = null,
  }) {
    return _then(Loaded(
      subject: null == subject
          ? _self._subject
          : subject // ignore: cast_nullable_to_non_nullable
              as List<SubjectModel>,
    ));
  }
}

/// @nodoc

class DetailsLoaded implements SalonState {
  const DetailsLoaded({required this.subject});

  final SubjectModel subject;

  /// Create a copy of SalonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DetailsLoadedCopyWith<DetailsLoaded> get copyWith =>
      _$DetailsLoadedCopyWithImpl<DetailsLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DetailsLoaded &&
            (identical(other.subject, subject) || other.subject == subject));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subject);

  @override
  String toString() {
    return 'SalonState.detailsLoaded(subject: $subject)';
  }
}

/// @nodoc
abstract mixin class $DetailsLoadedCopyWith<$Res>
    implements $SalonStateCopyWith<$Res> {
  factory $DetailsLoadedCopyWith(
          DetailsLoaded value, $Res Function(DetailsLoaded) _then) =
      _$DetailsLoadedCopyWithImpl;
  @useResult
  $Res call({SubjectModel subject});

  $SubjectModelCopyWith<$Res> get subject;
}

/// @nodoc
class _$DetailsLoadedCopyWithImpl<$Res>
    implements $DetailsLoadedCopyWith<$Res> {
  _$DetailsLoadedCopyWithImpl(this._self, this._then);

  final DetailsLoaded _self;
  final $Res Function(DetailsLoaded) _then;

  /// Create a copy of SalonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? subject = null,
  }) {
    return _then(DetailsLoaded(
      subject: null == subject
          ? _self.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectModel,
    ));
  }

  /// Create a copy of SalonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubjectModelCopyWith<$Res> get subject {
    return $SubjectModelCopyWith<$Res>(_self.subject, (value) {
      return _then(_self.copyWith(subject: value));
    });
  }
}

/// @nodoc

class CourseOperationSuccess implements SalonState {
  const CourseOperationSuccess({required this.message});

  final String message;

  /// Create a copy of SalonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseOperationSuccessCopyWith<CourseOperationSuccess> get copyWith =>
      _$CourseOperationSuccessCopyWithImpl<CourseOperationSuccess>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseOperationSuccess &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'SalonState.courseOperationSuccess(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CourseOperationSuccessCopyWith<$Res>
    implements $SalonStateCopyWith<$Res> {
  factory $CourseOperationSuccessCopyWith(CourseOperationSuccess value,
          $Res Function(CourseOperationSuccess) _then) =
      _$CourseOperationSuccessCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CourseOperationSuccessCopyWithImpl<$Res>
    implements $CourseOperationSuccessCopyWith<$Res> {
  _$CourseOperationSuccessCopyWithImpl(this._self, this._then);

  final CourseOperationSuccess _self;
  final $Res Function(CourseOperationSuccess) _then;

  /// Create a copy of SalonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CourseOperationSuccess(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class CourseError implements SalonState {
  const CourseError({required this.message});

  final String message;

  /// Create a copy of SalonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseErrorCopyWith<CourseError> get copyWith =>
      _$CourseErrorCopyWithImpl<CourseError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'SalonState.courseError(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CourseErrorCopyWith<$Res>
    implements $SalonStateCopyWith<$Res> {
  factory $CourseErrorCopyWith(
          CourseError value, $Res Function(CourseError) _then) =
      _$CourseErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CourseErrorCopyWithImpl<$Res> implements $CourseErrorCopyWith<$Res> {
  _$CourseErrorCopyWithImpl(this._self, this._then);

  final CourseError _self;
  final $Res Function(CourseError) _then;

  /// Create a copy of SalonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CourseError(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$SalonEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SalonEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SalonEvent()';
  }
}

/// @nodoc
class $SalonEventCopyWith<$Res> {
  $SalonEventCopyWith(SalonEvent _, $Res Function(SalonEvent) __);
}

/// @nodoc

class _FetchSubjects implements SalonEvent {
  const _FetchSubjects();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FetchSubjects);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SalonEvent.fetchSubjects()';
  }
}

/// @nodoc

class _ToggleSidebar implements SalonEvent {
  const _ToggleSidebar();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ToggleSidebar);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SalonEvent.toggleSidebar()';
  }
}

/// @nodoc

class _LoadCourses implements SalonEvent {
  const _LoadCourses();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadCourses);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SalonEvent.loadCourses()';
  }
}

/// @nodoc

class _LoadCourseDetails implements SalonEvent {
  const _LoadCourseDetails({required this.courseId});

  final String courseId;

  /// Create a copy of SalonEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadCourseDetailsCopyWith<_LoadCourseDetails> get copyWith =>
      __$LoadCourseDetailsCopyWithImpl<_LoadCourseDetails>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadCourseDetails &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseId);

  @override
  String toString() {
    return 'SalonEvent.loadCourseDetails(courseId: $courseId)';
  }
}

/// @nodoc
abstract mixin class _$LoadCourseDetailsCopyWith<$Res>
    implements $SalonEventCopyWith<$Res> {
  factory _$LoadCourseDetailsCopyWith(
          _LoadCourseDetails value, $Res Function(_LoadCourseDetails) _then) =
      __$LoadCourseDetailsCopyWithImpl;
  @useResult
  $Res call({String courseId});
}

/// @nodoc
class __$LoadCourseDetailsCopyWithImpl<$Res>
    implements _$LoadCourseDetailsCopyWith<$Res> {
  __$LoadCourseDetailsCopyWithImpl(this._self, this._then);

  final _LoadCourseDetails _self;
  final $Res Function(_LoadCourseDetails) _then;

  /// Create a copy of SalonEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? courseId = null,
  }) {
    return _then(_LoadCourseDetails(
      courseId: null == courseId
          ? _self.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _AddCourse implements SalonEvent {
  const _AddCourse({required this.subject});

  final SubjectModel subject;

  /// Create a copy of SalonEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddCourseCopyWith<_AddCourse> get copyWith =>
      __$AddCourseCopyWithImpl<_AddCourse>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddCourse &&
            (identical(other.subject, subject) || other.subject == subject));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subject);

  @override
  String toString() {
    return 'SalonEvent.addCourse(subject: $subject)';
  }
}

/// @nodoc
abstract mixin class _$AddCourseCopyWith<$Res>
    implements $SalonEventCopyWith<$Res> {
  factory _$AddCourseCopyWith(
          _AddCourse value, $Res Function(_AddCourse) _then) =
      __$AddCourseCopyWithImpl;
  @useResult
  $Res call({SubjectModel subject});

  $SubjectModelCopyWith<$Res> get subject;
}

/// @nodoc
class __$AddCourseCopyWithImpl<$Res> implements _$AddCourseCopyWith<$Res> {
  __$AddCourseCopyWithImpl(this._self, this._then);

  final _AddCourse _self;
  final $Res Function(_AddCourse) _then;

  /// Create a copy of SalonEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? subject = null,
  }) {
    return _then(_AddCourse(
      subject: null == subject
          ? _self.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectModel,
    ));
  }

  /// Create a copy of SalonEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubjectModelCopyWith<$Res> get subject {
    return $SubjectModelCopyWith<$Res>(_self.subject, (value) {
      return _then(_self.copyWith(subject: value));
    });
  }
}

/// @nodoc

class _UpdateCourse implements SalonEvent {
  const _UpdateCourse({required final List<SubjectModel> course})
      : _course = course;

  final List<SubjectModel> _course;
  List<SubjectModel> get course {
    if (_course is EqualUnmodifiableListView) return _course;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_course);
  }

  /// Create a copy of SalonEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateCourseCopyWith<_UpdateCourse> get copyWith =>
      __$UpdateCourseCopyWithImpl<_UpdateCourse>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateCourse &&
            const DeepCollectionEquality().equals(other._course, _course));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_course));

  @override
  String toString() {
    return 'SalonEvent.updateCourse(course: $course)';
  }
}

/// @nodoc
abstract mixin class _$UpdateCourseCopyWith<$Res>
    implements $SalonEventCopyWith<$Res> {
  factory _$UpdateCourseCopyWith(
          _UpdateCourse value, $Res Function(_UpdateCourse) _then) =
      __$UpdateCourseCopyWithImpl;
  @useResult
  $Res call({List<SubjectModel> course});
}

/// @nodoc
class __$UpdateCourseCopyWithImpl<$Res>
    implements _$UpdateCourseCopyWith<$Res> {
  __$UpdateCourseCopyWithImpl(this._self, this._then);

  final _UpdateCourse _self;
  final $Res Function(_UpdateCourse) _then;

  /// Create a copy of SalonEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? course = null,
  }) {
    return _then(_UpdateCourse(
      course: null == course
          ? _self._course
          : course // ignore: cast_nullable_to_non_nullable
              as List<SubjectModel>,
    ));
  }
}

/// @nodoc

class _DeleteCourse implements SalonEvent {
  const _DeleteCourse({required this.courseId});

  final String courseId;

  /// Create a copy of SalonEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeleteCourseCopyWith<_DeleteCourse> get copyWith =>
      __$DeleteCourseCopyWithImpl<_DeleteCourse>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteCourse &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseId);

  @override
  String toString() {
    return 'SalonEvent.deleteCourse(courseId: $courseId)';
  }
}

/// @nodoc
abstract mixin class _$DeleteCourseCopyWith<$Res>
    implements $SalonEventCopyWith<$Res> {
  factory _$DeleteCourseCopyWith(
          _DeleteCourse value, $Res Function(_DeleteCourse) _then) =
      __$DeleteCourseCopyWithImpl;
  @useResult
  $Res call({String courseId});
}

/// @nodoc
class __$DeleteCourseCopyWithImpl<$Res>
    implements _$DeleteCourseCopyWith<$Res> {
  __$DeleteCourseCopyWithImpl(this._self, this._then);

  final _DeleteCourse _self;
  final $Res Function(_DeleteCourse) _then;

  /// Create a copy of SalonEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? courseId = null,
  }) {
    return _then(_DeleteCourse(
      courseId: null == courseId
          ? _self.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _LoadCoursesSuccess implements SalonEvent {
  const _LoadCoursesSuccess(final List<SubjectModel> courses)
      : _courses = courses;

  final List<SubjectModel> _courses;
  List<SubjectModel> get courses {
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courses);
  }

  /// Create a copy of SalonEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadCoursesSuccessCopyWith<_LoadCoursesSuccess> get copyWith =>
      __$LoadCoursesSuccessCopyWithImpl<_LoadCoursesSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadCoursesSuccess &&
            const DeepCollectionEquality().equals(other._courses, _courses));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_courses));

  @override
  String toString() {
    return 'SalonEvent.loadCoursesSuccess(courses: $courses)';
  }
}

/// @nodoc
abstract mixin class _$LoadCoursesSuccessCopyWith<$Res>
    implements $SalonEventCopyWith<$Res> {
  factory _$LoadCoursesSuccessCopyWith(
          _LoadCoursesSuccess value, $Res Function(_LoadCoursesSuccess) _then) =
      __$LoadCoursesSuccessCopyWithImpl;
  @useResult
  $Res call({List<SubjectModel> courses});
}

/// @nodoc
class __$LoadCoursesSuccessCopyWithImpl<$Res>
    implements _$LoadCoursesSuccessCopyWith<$Res> {
  __$LoadCoursesSuccessCopyWithImpl(this._self, this._then);

  final _LoadCoursesSuccess _self;
  final $Res Function(_LoadCoursesSuccess) _then;

  /// Create a copy of SalonEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? courses = null,
  }) {
    return _then(_LoadCoursesSuccess(
      null == courses
          ? _self._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<SubjectModel>,
    ));
  }
}

// dart format on
