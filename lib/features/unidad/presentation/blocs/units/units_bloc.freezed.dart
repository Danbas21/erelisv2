// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'units_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnitsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UnitsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UnitsState()';
  }
}

/// @nodoc
class $UnitsStateCopyWith<$Res> {
  $UnitsStateCopyWith(UnitsState _, $Res Function(UnitsState) __);
}

/// @nodoc

class Initial implements UnitsState {
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
    return 'UnitsState.initial()';
  }
}

/// @nodoc

class Loading implements UnitsState {
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
    return 'UnitsState.loading()';
  }
}

/// @nodoc

class Loaded implements UnitsState {
  const Loaded(
      {required final List<Unit> units,
      required this.hasMoreUnits,
      required this.displayedCount})
      : _units = units;

  final List<Unit> _units;
  List<Unit> get units {
    if (_units is EqualUnmodifiableListView) return _units;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_units);
  }

  final bool hasMoreUnits;
  final int displayedCount;

  /// Create a copy of UnitsState
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
            const DeepCollectionEquality().equals(other._units, _units) &&
            (identical(other.hasMoreUnits, hasMoreUnits) ||
                other.hasMoreUnits == hasMoreUnits) &&
            (identical(other.displayedCount, displayedCount) ||
                other.displayedCount == displayedCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_units),
      hasMoreUnits,
      displayedCount);

  @override
  String toString() {
    return 'UnitsState.loaded(units: $units, hasMoreUnits: $hasMoreUnits, displayedCount: $displayedCount)';
  }
}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res>
    implements $UnitsStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) =
      _$LoadedCopyWithImpl;
  @useResult
  $Res call({List<Unit> units, bool hasMoreUnits, int displayedCount});
}

/// @nodoc
class _$LoadedCopyWithImpl<$Res> implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

  /// Create a copy of UnitsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? units = null,
    Object? hasMoreUnits = null,
    Object? displayedCount = null,
  }) {
    return _then(Loaded(
      units: null == units
          ? _self._units
          : units // ignore: cast_nullable_to_non_nullable
              as List<Unit>,
      hasMoreUnits: null == hasMoreUnits
          ? _self.hasMoreUnits
          : hasMoreUnits // ignore: cast_nullable_to_non_nullable
              as bool,
      displayedCount: null == displayedCount
          ? _self.displayedCount
          : displayedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class Empty implements UnitsState {
  const Empty(this.message);

  final String message;

  /// Create a copy of UnitsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmptyCopyWith<Empty> get copyWith =>
      _$EmptyCopyWithImpl<Empty>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Empty &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'UnitsState.empty(message: $message)';
  }
}

/// @nodoc
abstract mixin class $EmptyCopyWith<$Res> implements $UnitsStateCopyWith<$Res> {
  factory $EmptyCopyWith(Empty value, $Res Function(Empty) _then) =
      _$EmptyCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$EmptyCopyWithImpl<$Res> implements $EmptyCopyWith<$Res> {
  _$EmptyCopyWithImpl(this._self, this._then);

  final Empty _self;
  final $Res Function(Empty) _then;

  /// Create a copy of UnitsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(Empty(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class Error implements UnitsState {
  const Error(this.message);

  final String message;

  /// Create a copy of UnitsState
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
    return 'UnitsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $UnitsStateCopyWith<$Res> {
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

  /// Create a copy of UnitsState
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

/// @nodoc
mixin _$UnitsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UnitsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UnitsEvent()';
  }
}

/// @nodoc
class $UnitsEventCopyWith<$Res> {
  $UnitsEventCopyWith(UnitsEvent _, $Res Function(UnitsEvent) __);
}

/// @nodoc

class _Started implements UnitsEvent {
  const _Started(this.courseId, this.courseName);

  final String courseId;
  final String courseName;

  /// Create a copy of UnitsEvent
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
            (identical(other.courseName, courseName) ||
                other.courseName == courseName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, courseId, courseName);

  @override
  String toString() {
    return 'UnitsEvent.started(courseId: $courseId, courseName: $courseName)';
  }
}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res>
    implements $UnitsEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) =
      __$StartedCopyWithImpl;
  @useResult
  $Res call({String courseId, String courseName});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

  /// Create a copy of UnitsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? courseId = null,
    Object? courseName = null,
  }) {
    return _then(_Started(
      null == courseId
          ? _self.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      null == courseName
          ? _self.courseName
          : courseName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _LoadMore implements UnitsEvent {
  const _LoadMore();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadMore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UnitsEvent.loadMore()';
  }
}

// dart format on
