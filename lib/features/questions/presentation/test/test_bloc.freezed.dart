// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TestEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TestEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TestEvent()';
  }
}

/// @nodoc
class $TestEventCopyWith<$Res> {
  $TestEventCopyWith(TestEvent _, $Res Function(TestEvent) __);
}

/// @nodoc

class _Started implements TestEvent {
  const _Started(this.courseId, this.unitId);

  final String courseId;
  final String unitId;

  /// Create a copy of TestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StartedCopyWith<_Started> get copyWith =>
      __$StartedCopyWithImpl<_Started>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Started &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.unitId, unitId) || other.unitId == unitId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseId, unitId);

  @override
  String toString() {
    return 'TestEvent.started(courseId: $courseId, unitId: $unitId)';
  }
}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res>
    implements $TestEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) =
      __$StartedCopyWithImpl;
  @useResult
  $Res call({String courseId, String unitId});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

  /// Create a copy of TestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? courseId = null,
    Object? unitId = null,
  }) {
    return _then(_Started(
      null == courseId
          ? _self.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      null == unitId
          ? _self.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _AnswerSelected implements TestEvent {
  const _AnswerSelected(this.questionId, this.optionIndex);

  final String questionId;
  final int optionIndex;

  /// Create a copy of TestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AnswerSelectedCopyWith<_AnswerSelected> get copyWith =>
      __$AnswerSelectedCopyWithImpl<_AnswerSelected>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnswerSelected &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.optionIndex, optionIndex) ||
                other.optionIndex == optionIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, questionId, optionIndex);

  @override
  String toString() {
    return 'TestEvent.answerSelected(questionId: $questionId, optionIndex: $optionIndex)';
  }
}

/// @nodoc
abstract mixin class _$AnswerSelectedCopyWith<$Res>
    implements $TestEventCopyWith<$Res> {
  factory _$AnswerSelectedCopyWith(
          _AnswerSelected value, $Res Function(_AnswerSelected) _then) =
      __$AnswerSelectedCopyWithImpl;
  @useResult
  $Res call({String questionId, int optionIndex});
}

/// @nodoc
class __$AnswerSelectedCopyWithImpl<$Res>
    implements _$AnswerSelectedCopyWith<$Res> {
  __$AnswerSelectedCopyWithImpl(this._self, this._then);

  final _AnswerSelected _self;
  final $Res Function(_AnswerSelected) _then;

  /// Create a copy of TestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? questionId = null,
    Object? optionIndex = null,
  }) {
    return _then(_AnswerSelected(
      null == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      null == optionIndex
          ? _self.optionIndex
          : optionIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _NextQuestion implements TestEvent {
  const _NextQuestion();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NextQuestion);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TestEvent.nextQuestion()';
  }
}

/// @nodoc

class _PreviousQuestion implements TestEvent {
  const _PreviousQuestion();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PreviousQuestion);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TestEvent.previousQuestion()';
  }
}

/// @nodoc

class _NavigateToQuestion implements TestEvent {
  const _NavigateToQuestion(this.index);

  final int index;

  /// Create a copy of TestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NavigateToQuestionCopyWith<_NavigateToQuestion> get copyWith =>
      __$NavigateToQuestionCopyWithImpl<_NavigateToQuestion>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NavigateToQuestion &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @override
  String toString() {
    return 'TestEvent.navigateToQuestion(index: $index)';
  }
}

/// @nodoc
abstract mixin class _$NavigateToQuestionCopyWith<$Res>
    implements $TestEventCopyWith<$Res> {
  factory _$NavigateToQuestionCopyWith(
          _NavigateToQuestion value, $Res Function(_NavigateToQuestion) _then) =
      __$NavigateToQuestionCopyWithImpl;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$NavigateToQuestionCopyWithImpl<$Res>
    implements _$NavigateToQuestionCopyWith<$Res> {
  __$NavigateToQuestionCopyWithImpl(this._self, this._then);

  final _NavigateToQuestion _self;
  final $Res Function(_NavigateToQuestion) _then;

  /// Create a copy of TestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? index = null,
  }) {
    return _then(_NavigateToQuestion(
      null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _SaveProgress implements TestEvent {
  const _SaveProgress();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SaveProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TestEvent.saveProgress()';
  }
}

/// @nodoc

class _SubmitTest implements TestEvent {
  const _SubmitTest();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SubmitTest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TestEvent.submitTest()';
  }
}

/// @nodoc
mixin _$TestState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TestState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TestState()';
  }
}

/// @nodoc
class $TestStateCopyWith<$Res> {
  $TestStateCopyWith(TestState _, $Res Function(TestState) __);
}

/// @nodoc

class Initial implements TestState {
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
    return 'TestState.initial()';
  }
}

/// @nodoc

class Loading implements TestState {
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
    return 'TestState.loading()';
  }
}

/// @nodoc

class Loaded implements TestState {
  const Loaded(
      {required final List<Question> questions,
      required this.currentQuestionIndex,
      required final Map<String, int> userAnswers,
      required this.isCompleted})
      : _questions = questions,
        _userAnswers = userAnswers;

  final List<Question> _questions;
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  final int currentQuestionIndex;
  final Map<String, int> _userAnswers;
  Map<String, int> get userAnswers {
    if (_userAnswers is EqualUnmodifiableMapView) return _userAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_userAnswers);
  }

  final bool isCompleted;

  /// Create a copy of TestState
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
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.currentQuestionIndex, currentQuestionIndex) ||
                other.currentQuestionIndex == currentQuestionIndex) &&
            const DeepCollectionEquality()
                .equals(other._userAnswers, _userAnswers) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_questions),
      currentQuestionIndex,
      const DeepCollectionEquality().hash(_userAnswers),
      isCompleted);

  @override
  String toString() {
    return 'TestState.loaded(questions: $questions, currentQuestionIndex: $currentQuestionIndex, userAnswers: $userAnswers, isCompleted: $isCompleted)';
  }
}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $TestStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) =
      _$LoadedCopyWithImpl;
  @useResult
  $Res call(
      {List<Question> questions,
      int currentQuestionIndex,
      Map<String, int> userAnswers,
      bool isCompleted});
}

/// @nodoc
class _$LoadedCopyWithImpl<$Res> implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

  /// Create a copy of TestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? questions = null,
    Object? currentQuestionIndex = null,
    Object? userAnswers = null,
    Object? isCompleted = null,
  }) {
    return _then(Loaded(
      questions: null == questions
          ? _self._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
      currentQuestionIndex: null == currentQuestionIndex
          ? _self.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      userAnswers: null == userAnswers
          ? _self._userAnswers
          : userAnswers // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class Completed implements TestState {
  const Completed({required this.result});

  final TestResult result;

  /// Create a copy of TestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CompletedCopyWith<Completed> get copyWith =>
      _$CompletedCopyWithImpl<Completed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Completed &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @override
  String toString() {
    return 'TestState.completed(result: $result)';
  }
}

/// @nodoc
abstract mixin class $CompletedCopyWith<$Res>
    implements $TestStateCopyWith<$Res> {
  factory $CompletedCopyWith(Completed value, $Res Function(Completed) _then) =
      _$CompletedCopyWithImpl;
  @useResult
  $Res call({TestResult result});

  $TestResultCopyWith<$Res> get result;
}

/// @nodoc
class _$CompletedCopyWithImpl<$Res> implements $CompletedCopyWith<$Res> {
  _$CompletedCopyWithImpl(this._self, this._then);

  final Completed _self;
  final $Res Function(Completed) _then;

  /// Create a copy of TestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? result = null,
  }) {
    return _then(Completed(
      result: null == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as TestResult,
    ));
  }

  /// Create a copy of TestState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TestResultCopyWith<$Res> get result {
    return $TestResultCopyWith<$Res>(_self.result, (value) {
      return _then(_self.copyWith(result: value));
    });
  }
}

/// @nodoc

class Error implements TestState {
  const Error(this.message);

  final String message;

  /// Create a copy of TestState
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
    return 'TestState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $TestStateCopyWith<$Res> {
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

  /// Create a copy of TestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(Error(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
