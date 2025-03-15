// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChapterEntity {
  String get id;
  String get name;
  int get chapterNumber;
  bool get isCompleted;
  List<TaskEntity> get tasks;

  /// Create a copy of ChapterEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChapterEntityCopyWith<ChapterEntity> get copyWith =>
      _$ChapterEntityCopyWithImpl<ChapterEntity>(
          this as ChapterEntity, _$identity);

  /// Serializes this ChapterEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChapterEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.chapterNumber, chapterNumber) ||
                other.chapterNumber == chapterNumber) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            const DeepCollectionEquality().equals(other.tasks, tasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, chapterNumber,
      isCompleted, const DeepCollectionEquality().hash(tasks));

  @override
  String toString() {
    return 'ChapterEntity(id: $id, name: $name, chapterNumber: $chapterNumber, isCompleted: $isCompleted, tasks: $tasks)';
  }
}

/// @nodoc
abstract mixin class $ChapterEntityCopyWith<$Res> {
  factory $ChapterEntityCopyWith(
          ChapterEntity value, $Res Function(ChapterEntity) _then) =
      _$ChapterEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      int chapterNumber,
      bool isCompleted,
      List<TaskEntity> tasks});
}

/// @nodoc
class _$ChapterEntityCopyWithImpl<$Res>
    implements $ChapterEntityCopyWith<$Res> {
  _$ChapterEntityCopyWithImpl(this._self, this._then);

  final ChapterEntity _self;
  final $Res Function(ChapterEntity) _then;

  /// Create a copy of ChapterEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? chapterNumber = null,
    Object? isCompleted = null,
    Object? tasks = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      chapterNumber: null == chapterNumber
          ? _self.chapterNumber
          : chapterNumber // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      tasks: null == tasks
          ? _self.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ChapterEntity implements ChapterEntity {
  const _ChapterEntity(
      {required this.id,
      required this.name,
      required this.chapterNumber,
      this.isCompleted = false,
      final List<TaskEntity> tasks = const []})
      : _tasks = tasks;
  factory _ChapterEntity.fromJson(Map<String, dynamic> json) =>
      _$ChapterEntityFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int chapterNumber;
  @override
  @JsonKey()
  final bool isCompleted;
  final List<TaskEntity> _tasks;
  @override
  @JsonKey()
  List<TaskEntity> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  /// Create a copy of ChapterEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChapterEntityCopyWith<_ChapterEntity> get copyWith =>
      __$ChapterEntityCopyWithImpl<_ChapterEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChapterEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChapterEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.chapterNumber, chapterNumber) ||
                other.chapterNumber == chapterNumber) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, chapterNumber,
      isCompleted, const DeepCollectionEquality().hash(_tasks));

  @override
  String toString() {
    return 'ChapterEntity(id: $id, name: $name, chapterNumber: $chapterNumber, isCompleted: $isCompleted, tasks: $tasks)';
  }
}

/// @nodoc
abstract mixin class _$ChapterEntityCopyWith<$Res>
    implements $ChapterEntityCopyWith<$Res> {
  factory _$ChapterEntityCopyWith(
          _ChapterEntity value, $Res Function(_ChapterEntity) _then) =
      __$ChapterEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int chapterNumber,
      bool isCompleted,
      List<TaskEntity> tasks});
}

/// @nodoc
class __$ChapterEntityCopyWithImpl<$Res>
    implements _$ChapterEntityCopyWith<$Res> {
  __$ChapterEntityCopyWithImpl(this._self, this._then);

  final _ChapterEntity _self;
  final $Res Function(_ChapterEntity) _then;

  /// Create a copy of ChapterEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? chapterNumber = null,
    Object? isCompleted = null,
    Object? tasks = null,
  }) {
    return _then(_ChapterEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      chapterNumber: null == chapterNumber
          ? _self.chapterNumber
          : chapterNumber // ignore: cast_nullable_to_non_nullable
              as int,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      tasks: null == tasks
          ? _self._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
    ));
  }
}

// dart format on
