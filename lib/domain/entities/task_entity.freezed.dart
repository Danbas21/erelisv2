// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskEntity {
  String get id;
  String get name;
  String get page;
  String get dueTime;
  bool get isCompleted;

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskEntityCopyWith<TaskEntity> get copyWith =>
      _$TaskEntityCopyWithImpl<TaskEntity>(this as TaskEntity, _$identity);

  /// Serializes this TaskEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.dueTime, dueTime) || other.dueTime == dueTime) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, page, dueTime, isCompleted);

  @override
  String toString() {
    return 'TaskEntity(id: $id, name: $name, page: $page, dueTime: $dueTime, isCompleted: $isCompleted)';
  }
}

/// @nodoc
abstract mixin class $TaskEntityCopyWith<$Res> {
  factory $TaskEntityCopyWith(
          TaskEntity value, $Res Function(TaskEntity) _then) =
      _$TaskEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id, String name, String page, String dueTime, bool isCompleted});
}

/// @nodoc
class _$TaskEntityCopyWithImpl<$Res> implements $TaskEntityCopyWith<$Res> {
  _$TaskEntityCopyWithImpl(this._self, this._then);

  final TaskEntity _self;
  final $Res Function(TaskEntity) _then;

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? page = null,
    Object? dueTime = null,
    Object? isCompleted = null,
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
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as String,
      dueTime: null == dueTime
          ? _self.dueTime
          : dueTime // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TaskEntity implements TaskEntity {
  const _TaskEntity(
      {required this.id,
      required this.name,
      required this.page,
      required this.dueTime,
      this.isCompleted = false});
  factory _TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String page;
  @override
  final String dueTime;
  @override
  @JsonKey()
  final bool isCompleted;

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskEntityCopyWith<_TaskEntity> get copyWith =>
      __$TaskEntityCopyWithImpl<_TaskEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TaskEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.dueTime, dueTime) || other.dueTime == dueTime) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, page, dueTime, isCompleted);

  @override
  String toString() {
    return 'TaskEntity(id: $id, name: $name, page: $page, dueTime: $dueTime, isCompleted: $isCompleted)';
  }
}

/// @nodoc
abstract mixin class _$TaskEntityCopyWith<$Res>
    implements $TaskEntityCopyWith<$Res> {
  factory _$TaskEntityCopyWith(
          _TaskEntity value, $Res Function(_TaskEntity) _then) =
      __$TaskEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id, String name, String page, String dueTime, bool isCompleted});
}

/// @nodoc
class __$TaskEntityCopyWithImpl<$Res> implements _$TaskEntityCopyWith<$Res> {
  __$TaskEntityCopyWithImpl(this._self, this._then);

  final _TaskEntity _self;
  final $Res Function(_TaskEntity) _then;

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? page = null,
    Object? dueTime = null,
    Object? isCompleted = null,
  }) {
    return _then(_TaskEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as String,
      dueTime: null == dueTime
          ? _self.dueTime
          : dueTime // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _self.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
