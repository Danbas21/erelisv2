// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnitModel {
  String get id;
  String get title;
  String get content;
  bool get isCompleted;
  String get courseId;
  DateTime get lastVisited;

  /// Create a copy of UnitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnitModelCopyWith<UnitModel> get copyWith =>
      _$UnitModelCopyWithImpl<UnitModel>(this as UnitModel, _$identity);

  /// Serializes this UnitModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnitModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.lastVisited, lastVisited) ||
                other.lastVisited == lastVisited));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, content, isCompleted, courseId, lastVisited);

  @override
  String toString() {
    return 'UnitModel(id: $id, title: $title, content: $content, isCompleted: $isCompleted, courseId: $courseId, lastVisited: $lastVisited)';
  }
}

/// @nodoc
abstract mixin class $UnitModelCopyWith<$Res> {
  factory $UnitModelCopyWith(UnitModel value, $Res Function(UnitModel) _then) =
      _$UnitModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      bool isCompleted,
      String courseId,
      DateTime lastVisited});
}

/// @nodoc
class _$UnitModelCopyWithImpl<$Res> implements $UnitModelCopyWith<$Res> {
  _$UnitModelCopyWithImpl(this._self, this._then);

  final UnitModel _self;
  final $Res Function(UnitModel) _then;

  /// Create a copy of UnitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? isCompleted = null,
    Object? courseId = null,
    Object? lastVisited = null,
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
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      courseId: null == courseId
          ? _self.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      lastVisited: null == lastVisited
          ? _self.lastVisited
          : lastVisited // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UnitModel extends UnitModel {
  const _UnitModel(
      {required this.id,
      required this.title,
      required this.content,
      this.isCompleted = false,
      required this.courseId,
      required this.lastVisited})
      : super._();
  factory _UnitModel.fromJson(Map<String, dynamic> json) =>
      _$UnitModelFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  final String courseId;
  @override
  final DateTime lastVisited;

  /// Create a copy of UnitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UnitModelCopyWith<_UnitModel> get copyWith =>
      __$UnitModelCopyWithImpl<_UnitModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UnitModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnitModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.lastVisited, lastVisited) ||
                other.lastVisited == lastVisited));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, content, isCompleted, courseId, lastVisited);

  @override
  String toString() {
    return 'UnitModel(id: $id, title: $title, content: $content, isCompleted: $isCompleted, courseId: $courseId, lastVisited: $lastVisited)';
  }
}

/// @nodoc
abstract mixin class _$UnitModelCopyWith<$Res>
    implements $UnitModelCopyWith<$Res> {
  factory _$UnitModelCopyWith(
          _UnitModel value, $Res Function(_UnitModel) _then) =
      __$UnitModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      bool isCompleted,
      String courseId,
      DateTime lastVisited});
}

/// @nodoc
class __$UnitModelCopyWithImpl<$Res> implements _$UnitModelCopyWith<$Res> {
  __$UnitModelCopyWithImpl(this._self, this._then);

  final _UnitModel _self;
  final $Res Function(_UnitModel) _then;

  /// Create a copy of UnitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? isCompleted = null,
    Object? courseId = null,
    Object? lastVisited = null,
  }) {
    return _then(_UnitModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      courseId: null == courseId
          ? _self.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
      lastVisited: null == lastVisited
          ? _self.lastVisited
          : lastVisited // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
