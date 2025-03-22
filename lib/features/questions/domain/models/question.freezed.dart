// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Question {
  String get id;
  String get text;
  String get type;
  int get points;
  List<QuestionOption> get options;
  String get explanation;
  int get order;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuestionCopyWith<Question> get copyWith =>
      _$QuestionCopyWithImpl<Question>(this as Question, _$identity);

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Question &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.points, points) || other.points == points) &&
            const DeepCollectionEquality().equals(other.options, options) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, type, points,
      const DeepCollectionEquality().hash(options), explanation, order);

  @override
  String toString() {
    return 'Question(id: $id, text: $text, type: $type, points: $points, options: $options, explanation: $explanation, order: $order)';
  }
}

/// @nodoc
abstract mixin class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) _then) =
      _$QuestionCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String text,
      String type,
      int points,
      List<QuestionOption> options,
      String explanation,
      int order});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res> implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._self, this._then);

  final Question _self;
  final $Res Function(Question) _then;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? type = null,
    Object? points = null,
    Object? options = null,
    Object? explanation = null,
    Object? order = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      options: null == options
          ? _self.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<QuestionOption>,
      explanation: null == explanation
          ? _self.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Question implements Question {
  const _Question(
      {required this.id,
      required this.text,
      required this.type,
      required this.points,
      required final List<QuestionOption> options,
      required this.explanation,
      required this.order})
      : _options = options;
  factory _Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final String type;
  @override
  final int points;
  final List<QuestionOption> _options;
  @override
  List<QuestionOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final String explanation;
  @override
  final int order;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuestionCopyWith<_Question> get copyWith =>
      __$QuestionCopyWithImpl<_Question>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuestionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Question &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.points, points) || other.points == points) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, type, points,
      const DeepCollectionEquality().hash(_options), explanation, order);

  @override
  String toString() {
    return 'Question(id: $id, text: $text, type: $type, points: $points, options: $options, explanation: $explanation, order: $order)';
  }
}

/// @nodoc
abstract mixin class _$QuestionCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$QuestionCopyWith(_Question value, $Res Function(_Question) _then) =
      __$QuestionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String text,
      String type,
      int points,
      List<QuestionOption> options,
      String explanation,
      int order});
}

/// @nodoc
class __$QuestionCopyWithImpl<$Res> implements _$QuestionCopyWith<$Res> {
  __$QuestionCopyWithImpl(this._self, this._then);

  final _Question _self;
  final $Res Function(_Question) _then;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? type = null,
    Object? points = null,
    Object? options = null,
    Object? explanation = null,
    Object? order = null,
  }) {
    return _then(_Question(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      options: null == options
          ? _self._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<QuestionOption>,
      explanation: null == explanation
          ? _self.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$QuestionOption {
  String get text;
  bool get isCorrect;

  /// Create a copy of QuestionOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuestionOptionCopyWith<QuestionOption> get copyWith =>
      _$QuestionOptionCopyWithImpl<QuestionOption>(
          this as QuestionOption, _$identity);

  /// Serializes this QuestionOption to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QuestionOption &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, isCorrect);

  @override
  String toString() {
    return 'QuestionOption(text: $text, isCorrect: $isCorrect)';
  }
}

/// @nodoc
abstract mixin class $QuestionOptionCopyWith<$Res> {
  factory $QuestionOptionCopyWith(
          QuestionOption value, $Res Function(QuestionOption) _then) =
      _$QuestionOptionCopyWithImpl;
  @useResult
  $Res call({String text, bool isCorrect});
}

/// @nodoc
class _$QuestionOptionCopyWithImpl<$Res>
    implements $QuestionOptionCopyWith<$Res> {
  _$QuestionOptionCopyWithImpl(this._self, this._then);

  final QuestionOption _self;
  final $Res Function(QuestionOption) _then;

  /// Create a copy of QuestionOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? isCorrect = null,
  }) {
    return _then(_self.copyWith(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _self.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _QuestionOption implements QuestionOption {
  const _QuestionOption({required this.text, required this.isCorrect});
  factory _QuestionOption.fromJson(Map<String, dynamic> json) =>
      _$QuestionOptionFromJson(json);

  @override
  final String text;
  @override
  final bool isCorrect;

  /// Create a copy of QuestionOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuestionOptionCopyWith<_QuestionOption> get copyWith =>
      __$QuestionOptionCopyWithImpl<_QuestionOption>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuestionOptionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuestionOption &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, isCorrect);

  @override
  String toString() {
    return 'QuestionOption(text: $text, isCorrect: $isCorrect)';
  }
}

/// @nodoc
abstract mixin class _$QuestionOptionCopyWith<$Res>
    implements $QuestionOptionCopyWith<$Res> {
  factory _$QuestionOptionCopyWith(
          _QuestionOption value, $Res Function(_QuestionOption) _then) =
      __$QuestionOptionCopyWithImpl;
  @override
  @useResult
  $Res call({String text, bool isCorrect});
}

/// @nodoc
class __$QuestionOptionCopyWithImpl<$Res>
    implements _$QuestionOptionCopyWith<$Res> {
  __$QuestionOptionCopyWithImpl(this._self, this._then);

  final _QuestionOption _self;
  final $Res Function(_QuestionOption) _then;

  /// Create a copy of QuestionOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
    Object? isCorrect = null,
  }) {
    return _then(_QuestionOption(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: null == isCorrect
          ? _self.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$UserAnswer {
  String get questionId;
  int get selectedOptionIndex;
  bool get isCorrect;

  /// Create a copy of UserAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserAnswerCopyWith<UserAnswer> get copyWith =>
      _$UserAnswerCopyWithImpl<UserAnswer>(this as UserAnswer, _$identity);

  /// Serializes this UserAnswer to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserAnswer &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.selectedOptionIndex, selectedOptionIndex) ||
                other.selectedOptionIndex == selectedOptionIndex) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, questionId, selectedOptionIndex, isCorrect);

  @override
  String toString() {
    return 'UserAnswer(questionId: $questionId, selectedOptionIndex: $selectedOptionIndex, isCorrect: $isCorrect)';
  }
}

/// @nodoc
abstract mixin class $UserAnswerCopyWith<$Res> {
  factory $UserAnswerCopyWith(
          UserAnswer value, $Res Function(UserAnswer) _then) =
      _$UserAnswerCopyWithImpl;
  @useResult
  $Res call({String questionId, int selectedOptionIndex, bool isCorrect});
}

/// @nodoc
class _$UserAnswerCopyWithImpl<$Res> implements $UserAnswerCopyWith<$Res> {
  _$UserAnswerCopyWithImpl(this._self, this._then);

  final UserAnswer _self;
  final $Res Function(UserAnswer) _then;

  /// Create a copy of UserAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? selectedOptionIndex = null,
    Object? isCorrect = null,
  }) {
    return _then(_self.copyWith(
      questionId: null == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedOptionIndex: null == selectedOptionIndex
          ? _self.selectedOptionIndex
          : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isCorrect: null == isCorrect
          ? _self.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserAnswer implements UserAnswer {
  const _UserAnswer(
      {required this.questionId,
      required this.selectedOptionIndex,
      required this.isCorrect});
  factory _UserAnswer.fromJson(Map<String, dynamic> json) =>
      _$UserAnswerFromJson(json);

  @override
  final String questionId;
  @override
  final int selectedOptionIndex;
  @override
  final bool isCorrect;

  /// Create a copy of UserAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserAnswerCopyWith<_UserAnswer> get copyWith =>
      __$UserAnswerCopyWithImpl<_UserAnswer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserAnswerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserAnswer &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.selectedOptionIndex, selectedOptionIndex) ||
                other.selectedOptionIndex == selectedOptionIndex) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, questionId, selectedOptionIndex, isCorrect);

  @override
  String toString() {
    return 'UserAnswer(questionId: $questionId, selectedOptionIndex: $selectedOptionIndex, isCorrect: $isCorrect)';
  }
}

/// @nodoc
abstract mixin class _$UserAnswerCopyWith<$Res>
    implements $UserAnswerCopyWith<$Res> {
  factory _$UserAnswerCopyWith(
          _UserAnswer value, $Res Function(_UserAnswer) _then) =
      __$UserAnswerCopyWithImpl;
  @override
  @useResult
  $Res call({String questionId, int selectedOptionIndex, bool isCorrect});
}

/// @nodoc
class __$UserAnswerCopyWithImpl<$Res> implements _$UserAnswerCopyWith<$Res> {
  __$UserAnswerCopyWithImpl(this._self, this._then);

  final _UserAnswer _self;
  final $Res Function(_UserAnswer) _then;

  /// Create a copy of UserAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? questionId = null,
    Object? selectedOptionIndex = null,
    Object? isCorrect = null,
  }) {
    return _then(_UserAnswer(
      questionId: null == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedOptionIndex: null == selectedOptionIndex
          ? _self.selectedOptionIndex
          : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isCorrect: null == isCorrect
          ? _self.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$TestResult {
  String get testId;
  List<UserAnswer> get answers;
  int get totalPoints;
  int get earnedPoints;
  double get percentage;
  bool get isCompleted;

  /// Create a copy of TestResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TestResultCopyWith<TestResult> get copyWith =>
      _$TestResultCopyWithImpl<TestResult>(this as TestResult, _$identity);

  /// Serializes this TestResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TestResult &&
            (identical(other.testId, testId) || other.testId == testId) &&
            const DeepCollectionEquality().equals(other.answers, answers) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.earnedPoints, earnedPoints) ||
                other.earnedPoints == earnedPoints) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      testId,
      const DeepCollectionEquality().hash(answers),
      totalPoints,
      earnedPoints,
      percentage,
      isCompleted);

  @override
  String toString() {
    return 'TestResult(testId: $testId, answers: $answers, totalPoints: $totalPoints, earnedPoints: $earnedPoints, percentage: $percentage, isCompleted: $isCompleted)';
  }
}

/// @nodoc
abstract mixin class $TestResultCopyWith<$Res> {
  factory $TestResultCopyWith(
          TestResult value, $Res Function(TestResult) _then) =
      _$TestResultCopyWithImpl;
  @useResult
  $Res call(
      {String testId,
      List<UserAnswer> answers,
      int totalPoints,
      int earnedPoints,
      double percentage,
      bool isCompleted});
}

/// @nodoc
class _$TestResultCopyWithImpl<$Res> implements $TestResultCopyWith<$Res> {
  _$TestResultCopyWithImpl(this._self, this._then);

  final TestResult _self;
  final $Res Function(TestResult) _then;

  /// Create a copy of TestResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? testId = null,
    Object? answers = null,
    Object? totalPoints = null,
    Object? earnedPoints = null,
    Object? percentage = null,
    Object? isCompleted = null,
  }) {
    return _then(_self.copyWith(
      testId: null == testId
          ? _self.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _self.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<UserAnswer>,
      totalPoints: null == totalPoints
          ? _self.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      earnedPoints: null == earnedPoints
          ? _self.earnedPoints
          : earnedPoints // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TestResult implements TestResult {
  const _TestResult(
      {required this.testId,
      required final List<UserAnswer> answers,
      required this.totalPoints,
      required this.earnedPoints,
      required this.percentage,
      this.isCompleted = false})
      : _answers = answers;
  factory _TestResult.fromJson(Map<String, dynamic> json) =>
      _$TestResultFromJson(json);

  @override
  final String testId;
  final List<UserAnswer> _answers;
  @override
  List<UserAnswer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final int totalPoints;
  @override
  final int earnedPoints;
  @override
  final double percentage;
  @override
  @JsonKey()
  final bool isCompleted;

  /// Create a copy of TestResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TestResultCopyWith<_TestResult> get copyWith =>
      __$TestResultCopyWithImpl<_TestResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TestResultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TestResult &&
            (identical(other.testId, testId) || other.testId == testId) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.earnedPoints, earnedPoints) ||
                other.earnedPoints == earnedPoints) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      testId,
      const DeepCollectionEquality().hash(_answers),
      totalPoints,
      earnedPoints,
      percentage,
      isCompleted);

  @override
  String toString() {
    return 'TestResult(testId: $testId, answers: $answers, totalPoints: $totalPoints, earnedPoints: $earnedPoints, percentage: $percentage, isCompleted: $isCompleted)';
  }
}

/// @nodoc
abstract mixin class _$TestResultCopyWith<$Res>
    implements $TestResultCopyWith<$Res> {
  factory _$TestResultCopyWith(
          _TestResult value, $Res Function(_TestResult) _then) =
      __$TestResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String testId,
      List<UserAnswer> answers,
      int totalPoints,
      int earnedPoints,
      double percentage,
      bool isCompleted});
}

/// @nodoc
class __$TestResultCopyWithImpl<$Res> implements _$TestResultCopyWith<$Res> {
  __$TestResultCopyWithImpl(this._self, this._then);

  final _TestResult _self;
  final $Res Function(_TestResult) _then;

  /// Create a copy of TestResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? testId = null,
    Object? answers = null,
    Object? totalPoints = null,
    Object? earnedPoints = null,
    Object? percentage = null,
    Object? isCompleted = null,
  }) {
    return _then(_TestResult(
      testId: null == testId
          ? _self.testId
          : testId // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _self._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<UserAnswer>,
      totalPoints: null == totalPoints
          ? _self.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as int,
      earnedPoints: null == earnedPoints
          ? _self.earnedPoints
          : earnedPoints // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
