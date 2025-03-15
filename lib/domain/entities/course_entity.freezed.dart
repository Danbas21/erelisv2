// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CourseEntity {
  String get id;
  String get name;
  String get description;
  int get totalChapters;
  int get completedChapters;
  String get startTime;
  String get endTime;
  List<ChapterEntity> get chapters;

  /// Create a copy of CourseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseEntityCopyWith<CourseEntity> get copyWith =>
      _$CourseEntityCopyWithImpl<CourseEntity>(
          this as CourseEntity, _$identity);

  /// Serializes this CourseEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.totalChapters, totalChapters) ||
                other.totalChapters == totalChapters) &&
            (identical(other.completedChapters, completedChapters) ||
                other.completedChapters == completedChapters) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality().equals(other.chapters, chapters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      totalChapters,
      completedChapters,
      startTime,
      endTime,
      const DeepCollectionEquality().hash(chapters));

  @override
  String toString() {
    return 'CourseEntity(id: $id, name: $name, description: $description, totalChapters: $totalChapters, completedChapters: $completedChapters, startTime: $startTime, endTime: $endTime, chapters: $chapters)';
  }
}

/// @nodoc
abstract mixin class $CourseEntityCopyWith<$Res> {
  factory $CourseEntityCopyWith(
          CourseEntity value, $Res Function(CourseEntity) _then) =
      _$CourseEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      int totalChapters,
      int completedChapters,
      String startTime,
      String endTime,
      List<ChapterEntity> chapters});
}

/// @nodoc
class _$CourseEntityCopyWithImpl<$Res> implements $CourseEntityCopyWith<$Res> {
  _$CourseEntityCopyWithImpl(this._self, this._then);

  final CourseEntity _self;
  final $Res Function(CourseEntity) _then;

  /// Create a copy of CourseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? totalChapters = null,
    Object? completedChapters = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? chapters = null,
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
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      totalChapters: null == totalChapters
          ? _self.totalChapters
          : totalChapters // ignore: cast_nullable_to_non_nullable
              as int,
      completedChapters: null == completedChapters
          ? _self.completedChapters
          : completedChapters // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      chapters: null == chapters
          ? _self.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<ChapterEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CourseEntity implements CourseEntity {
  const _CourseEntity(
      {required this.id,
      required this.name,
      required this.description,
      required this.totalChapters,
      this.completedChapters = 0,
      required this.startTime,
      required this.endTime,
      final List<ChapterEntity> chapters = const []})
      : _chapters = chapters;
  factory _CourseEntity.fromJson(Map<String, dynamic> json) =>
      _$CourseEntityFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final int totalChapters;
  @override
  @JsonKey()
  final int completedChapters;
  @override
  final String startTime;
  @override
  final String endTime;
  final List<ChapterEntity> _chapters;
  @override
  @JsonKey()
  List<ChapterEntity> get chapters {
    if (_chapters is EqualUnmodifiableListView) return _chapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chapters);
  }

  /// Create a copy of CourseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CourseEntityCopyWith<_CourseEntity> get copyWith =>
      __$CourseEntityCopyWithImpl<_CourseEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CourseEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CourseEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.totalChapters, totalChapters) ||
                other.totalChapters == totalChapters) &&
            (identical(other.completedChapters, completedChapters) ||
                other.completedChapters == completedChapters) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      totalChapters,
      completedChapters,
      startTime,
      endTime,
      const DeepCollectionEquality().hash(_chapters));

  @override
  String toString() {
    return 'CourseEntity(id: $id, name: $name, description: $description, totalChapters: $totalChapters, completedChapters: $completedChapters, startTime: $startTime, endTime: $endTime, chapters: $chapters)';
  }
}

/// @nodoc
abstract mixin class _$CourseEntityCopyWith<$Res>
    implements $CourseEntityCopyWith<$Res> {
  factory _$CourseEntityCopyWith(
          _CourseEntity value, $Res Function(_CourseEntity) _then) =
      __$CourseEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      int totalChapters,
      int completedChapters,
      String startTime,
      String endTime,
      List<ChapterEntity> chapters});
}

/// @nodoc
class __$CourseEntityCopyWithImpl<$Res>
    implements _$CourseEntityCopyWith<$Res> {
  __$CourseEntityCopyWithImpl(this._self, this._then);

  final _CourseEntity _self;
  final $Res Function(_CourseEntity) _then;

  /// Create a copy of CourseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? totalChapters = null,
    Object? completedChapters = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? chapters = null,
  }) {
    return _then(_CourseEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      totalChapters: null == totalChapters
          ? _self.totalChapters
          : totalChapters // ignore: cast_nullable_to_non_nullable
              as int,
      completedChapters: null == completedChapters
          ? _self.completedChapters
          : completedChapters // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      chapters: null == chapters
          ? _self._chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<ChapterEntity>,
    ));
  }
}

// dart format on
