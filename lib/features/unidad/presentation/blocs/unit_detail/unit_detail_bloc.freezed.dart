// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HighlightData {
  String get text;
  String get color;

  /// Create a copy of HighlightData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HighlightDataCopyWith<HighlightData> get copyWith =>
      _$HighlightDataCopyWithImpl<HighlightData>(
          this as HighlightData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HighlightData &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, color);

  @override
  String toString() {
    return 'HighlightData(text: $text, color: $color)';
  }
}

/// @nodoc
abstract mixin class $HighlightDataCopyWith<$Res> {
  factory $HighlightDataCopyWith(
          HighlightData value, $Res Function(HighlightData) _then) =
      _$HighlightDataCopyWithImpl;
  @useResult
  $Res call({String text, String color});
}

/// @nodoc
class _$HighlightDataCopyWithImpl<$Res>
    implements $HighlightDataCopyWith<$Res> {
  _$HighlightDataCopyWithImpl(this._self, this._then);

  final HighlightData _self;
  final $Res Function(HighlightData) _then;

  /// Create a copy of HighlightData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? color = null,
  }) {
    return _then(_self.copyWith(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _HighlightData implements HighlightData {
  const _HighlightData({required this.text, required this.color});

  @override
  final String text;
  @override
  final String color;

  /// Create a copy of HighlightData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HighlightDataCopyWith<_HighlightData> get copyWith =>
      __$HighlightDataCopyWithImpl<_HighlightData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HighlightData &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, color);

  @override
  String toString() {
    return 'HighlightData(text: $text, color: $color)';
  }
}

/// @nodoc
abstract mixin class _$HighlightDataCopyWith<$Res>
    implements $HighlightDataCopyWith<$Res> {
  factory _$HighlightDataCopyWith(
          _HighlightData value, $Res Function(_HighlightData) _then) =
      __$HighlightDataCopyWithImpl;
  @override
  @useResult
  $Res call({String text, String color});
}

/// @nodoc
class __$HighlightDataCopyWithImpl<$Res>
    implements _$HighlightDataCopyWith<$Res> {
  __$HighlightDataCopyWithImpl(this._self, this._then);

  final _HighlightData _self;
  final $Res Function(_HighlightData) _then;

  /// Create a copy of HighlightData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
    Object? color = null,
  }) {
    return _then(_HighlightData(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$UnitDetailState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UnitDetailState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UnitDetailState()';
  }
}

/// @nodoc
class $UnitDetailStateCopyWith<$Res> {
  $UnitDetailStateCopyWith(
      UnitDetailState _, $Res Function(UnitDetailState) __);
}

/// @nodoc

class Initial implements UnitDetailState {
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
    return 'UnitDetailState.initial()';
  }
}

/// @nodoc

class Loading implements UnitDetailState {
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
    return 'UnitDetailState.loading()';
  }
}

/// @nodoc

class Loaded implements UnitDetailState {
  const Loaded(
      {required this.unit, required final List<HighlightData> highlights})
      : _highlights = highlights;

  final Unit unit;
  final List<HighlightData> _highlights;
  List<HighlightData> get highlights {
    if (_highlights is EqualUnmodifiableListView) return _highlights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_highlights);
  }

  /// Create a copy of UnitDetailState
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
            (identical(other.unit, unit) || other.unit == unit) &&
            const DeepCollectionEquality()
                .equals(other._highlights, _highlights));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, unit, const DeepCollectionEquality().hash(_highlights));

  @override
  String toString() {
    return 'UnitDetailState.loaded(unit: $unit, highlights: $highlights)';
  }
}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res>
    implements $UnitDetailStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) =
      _$LoadedCopyWithImpl;
  @useResult
  $Res call({Unit unit, List<HighlightData> highlights});
}

/// @nodoc
class _$LoadedCopyWithImpl<$Res> implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

  /// Create a copy of UnitDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? unit = null,
    Object? highlights = null,
  }) {
    return _then(Loaded(
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      highlights: null == highlights
          ? _self._highlights
          : highlights // ignore: cast_nullable_to_non_nullable
              as List<HighlightData>,
    ));
  }
}

/// @nodoc

class Error implements UnitDetailState {
  const Error(this.message);

  final String message;

  /// Create a copy of UnitDetailState
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
    return 'UnitDetailState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res>
    implements $UnitDetailStateCopyWith<$Res> {
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

  /// Create a copy of UnitDetailState
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
mixin _$UnitDetailEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UnitDetailEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UnitDetailEvent()';
  }
}

/// @nodoc
class $UnitDetailEventCopyWith<$Res> {
  $UnitDetailEventCopyWith(
      UnitDetailEvent _, $Res Function(UnitDetailEvent) __);
}

/// @nodoc

class _LoadUnit implements UnitDetailEvent {
  const _LoadUnit({required this.unitId, required this.courseId});

  final String unitId;
  final String courseId;

  /// Create a copy of UnitDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadUnitCopyWith<_LoadUnit> get copyWith =>
      __$LoadUnitCopyWithImpl<_LoadUnit>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadUnit &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unitId, courseId);

  @override
  String toString() {
    return 'UnitDetailEvent.loadUnit(unitId: $unitId, courseId: $courseId)';
  }
}

/// @nodoc
abstract mixin class _$LoadUnitCopyWith<$Res>
    implements $UnitDetailEventCopyWith<$Res> {
  factory _$LoadUnitCopyWith(_LoadUnit value, $Res Function(_LoadUnit) _then) =
      __$LoadUnitCopyWithImpl;
  @useResult
  $Res call({String unitId, String courseId});
}

/// @nodoc
class __$LoadUnitCopyWithImpl<$Res> implements _$LoadUnitCopyWith<$Res> {
  __$LoadUnitCopyWithImpl(this._self, this._then);

  final _LoadUnit _self;
  final $Res Function(_LoadUnit) _then;

  /// Create a copy of UnitDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? unitId = null,
    Object? courseId = null,
  }) {
    return _then(_LoadUnit(
      unitId: null == unitId
          ? _self.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: null == courseId
          ? _self.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _HighlightText implements UnitDetailEvent {
  const _HighlightText({required this.text, required this.color});

  final String text;
  final String color;

  /// Create a copy of UnitDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HighlightTextCopyWith<_HighlightText> get copyWith =>
      __$HighlightTextCopyWithImpl<_HighlightText>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HighlightText &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, color);

  @override
  String toString() {
    return 'UnitDetailEvent.highlightText(text: $text, color: $color)';
  }
}

/// @nodoc
abstract mixin class _$HighlightTextCopyWith<$Res>
    implements $UnitDetailEventCopyWith<$Res> {
  factory _$HighlightTextCopyWith(
          _HighlightText value, $Res Function(_HighlightText) _then) =
      __$HighlightTextCopyWithImpl;
  @useResult
  $Res call({String text, String color});
}

/// @nodoc
class __$HighlightTextCopyWithImpl<$Res>
    implements _$HighlightTextCopyWith<$Res> {
  __$HighlightTextCopyWithImpl(this._self, this._then);

  final _HighlightText _self;
  final $Res Function(_HighlightText) _then;

  /// Create a copy of UnitDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
    Object? color = null,
  }) {
    return _then(_HighlightText(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _MarkAsCompleted implements UnitDetailEvent {
  const _MarkAsCompleted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _MarkAsCompleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UnitDetailEvent.markAsCompleted()';
  }
}

// dart format on
