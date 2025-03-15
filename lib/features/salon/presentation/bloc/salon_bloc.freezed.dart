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
  List<SubjectModel> get subjects;
  bool get isSidebarExpanded;
  bool get isLoading;
  String? get errorMessage;

  /// Create a copy of SalonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SalonStateCopyWith<SalonState> get copyWith =>
      _$SalonStateCopyWithImpl<SalonState>(this as SalonState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SalonState &&
            const DeepCollectionEquality().equals(other.subjects, subjects) &&
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
      const DeepCollectionEquality().hash(subjects),
      isSidebarExpanded,
      isLoading,
      errorMessage);

  @override
  String toString() {
    return 'SalonState(subjects: $subjects, isSidebarExpanded: $isSidebarExpanded, isLoading: $isLoading, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $SalonStateCopyWith<$Res> {
  factory $SalonStateCopyWith(
          SalonState value, $Res Function(SalonState) _then) =
      _$SalonStateCopyWithImpl;
  @useResult
  $Res call(
      {List<SubjectModel> subjects,
      bool isSidebarExpanded,
      bool isLoading,
      String? errorMessage});
}

/// @nodoc
class _$SalonStateCopyWithImpl<$Res> implements $SalonStateCopyWith<$Res> {
  _$SalonStateCopyWithImpl(this._self, this._then);

  final SalonState _self;
  final $Res Function(SalonState) _then;

  /// Create a copy of SalonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjects = null,
    Object? isSidebarExpanded = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      subjects: null == subjects
          ? _self.subjects
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

class _SalonState implements SalonState {
  const _SalonState(
      {final List<SubjectModel> subjects = const [],
      this.isSidebarExpanded = true,
      this.isLoading = false,
      this.errorMessage})
      : _subjects = subjects;

  final List<SubjectModel> _subjects;
  @override
  @JsonKey()
  List<SubjectModel> get subjects {
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjects);
  }

  @override
  @JsonKey()
  final bool isSidebarExpanded;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  /// Create a copy of SalonState
  /// with the given fields replaced by the non-null parameter values.
  @override
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
  @override
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
  @override
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

// dart format on
