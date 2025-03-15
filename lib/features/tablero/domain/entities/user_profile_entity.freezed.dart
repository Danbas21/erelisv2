// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfileEntity {
  String get id;
  String get name;
  String get role;
  String? get photoUrl;
  List<SubjectEntity> get subjects;

  /// Create a copy of UserProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserProfileEntityCopyWith<UserProfileEntity> get copyWith =>
      _$UserProfileEntityCopyWithImpl<UserProfileEntity>(
          this as UserProfileEntity, _$identity);

  /// Serializes this UserProfileEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserProfileEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            const DeepCollectionEquality().equals(other.subjects, subjects));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, role, photoUrl,
      const DeepCollectionEquality().hash(subjects));

  @override
  String toString() {
    return 'UserProfileEntity(id: $id, name: $name, role: $role, photoUrl: $photoUrl, subjects: $subjects)';
  }
}

/// @nodoc
abstract mixin class $UserProfileEntityCopyWith<$Res> {
  factory $UserProfileEntityCopyWith(
          UserProfileEntity value, $Res Function(UserProfileEntity) _then) =
      _$UserProfileEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String role,
      String? photoUrl,
      List<SubjectEntity> subjects});
}

/// @nodoc
class _$UserProfileEntityCopyWithImpl<$Res>
    implements $UserProfileEntityCopyWith<$Res> {
  _$UserProfileEntityCopyWithImpl(this._self, this._then);

  final UserProfileEntity _self;
  final $Res Function(UserProfileEntity) _then;

  /// Create a copy of UserProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? photoUrl = freezed,
    Object? subjects = null,
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
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      subjects: null == subjects
          ? _self.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<SubjectEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserProfileEntity implements UserProfileEntity {
  const _UserProfileEntity(
      {required this.id,
      required this.name,
      required this.role,
      this.photoUrl,
      required final List<SubjectEntity> subjects})
      : _subjects = subjects;
  factory _UserProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$UserProfileEntityFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String role;
  @override
  final String? photoUrl;
  final List<SubjectEntity> _subjects;
  @override
  List<SubjectEntity> get subjects {
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjects);
  }

  /// Create a copy of UserProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserProfileEntityCopyWith<_UserProfileEntity> get copyWith =>
      __$UserProfileEntityCopyWithImpl<_UserProfileEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserProfileEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfileEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            const DeepCollectionEquality().equals(other._subjects, _subjects));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, role, photoUrl,
      const DeepCollectionEquality().hash(_subjects));

  @override
  String toString() {
    return 'UserProfileEntity(id: $id, name: $name, role: $role, photoUrl: $photoUrl, subjects: $subjects)';
  }
}

/// @nodoc
abstract mixin class _$UserProfileEntityCopyWith<$Res>
    implements $UserProfileEntityCopyWith<$Res> {
  factory _$UserProfileEntityCopyWith(
          _UserProfileEntity value, $Res Function(_UserProfileEntity) _then) =
      __$UserProfileEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String role,
      String? photoUrl,
      List<SubjectEntity> subjects});
}

/// @nodoc
class __$UserProfileEntityCopyWithImpl<$Res>
    implements _$UserProfileEntityCopyWith<$Res> {
  __$UserProfileEntityCopyWithImpl(this._self, this._then);

  final _UserProfileEntity _self;
  final $Res Function(_UserProfileEntity) _then;

  /// Create a copy of UserProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? photoUrl = freezed,
    Object? subjects = null,
  }) {
    return _then(_UserProfileEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      subjects: null == subjects
          ? _self._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<SubjectEntity>,
    ));
  }
}

/// @nodoc
mixin _$SubjectEntity {
  String get id;
  String get name;
  int get chapterCount;
  int get completedChapters;
  String get timeSlot;

  /// Create a copy of SubjectEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubjectEntityCopyWith<SubjectEntity> get copyWith =>
      _$SubjectEntityCopyWithImpl<SubjectEntity>(
          this as SubjectEntity, _$identity);

  /// Serializes this SubjectEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubjectEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.chapterCount, chapterCount) ||
                other.chapterCount == chapterCount) &&
            (identical(other.completedChapters, completedChapters) ||
                other.completedChapters == completedChapters) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, chapterCount, completedChapters, timeSlot);

  @override
  String toString() {
    return 'SubjectEntity(id: $id, name: $name, chapterCount: $chapterCount, completedChapters: $completedChapters, timeSlot: $timeSlot)';
  }
}

/// @nodoc
abstract mixin class $SubjectEntityCopyWith<$Res> {
  factory $SubjectEntityCopyWith(
          SubjectEntity value, $Res Function(SubjectEntity) _then) =
      _$SubjectEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      int chapterCount,
      int completedChapters,
      String timeSlot});
}

/// @nodoc
class _$SubjectEntityCopyWithImpl<$Res>
    implements $SubjectEntityCopyWith<$Res> {
  _$SubjectEntityCopyWithImpl(this._self, this._then);

  final SubjectEntity _self;
  final $Res Function(SubjectEntity) _then;

  /// Create a copy of SubjectEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? chapterCount = null,
    Object? completedChapters = null,
    Object? timeSlot = null,
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
      chapterCount: null == chapterCount
          ? _self.chapterCount
          : chapterCount // ignore: cast_nullable_to_non_nullable
              as int,
      completedChapters: null == completedChapters
          ? _self.completedChapters
          : completedChapters // ignore: cast_nullable_to_non_nullable
              as int,
      timeSlot: null == timeSlot
          ? _self.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SubjectEntity implements SubjectEntity {
  const _SubjectEntity(
      {required this.id,
      required this.name,
      required this.chapterCount,
      required this.completedChapters,
      required this.timeSlot});
  factory _SubjectEntity.fromJson(Map<String, dynamic> json) =>
      _$SubjectEntityFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int chapterCount;
  @override
  final int completedChapters;
  @override
  final String timeSlot;

  /// Create a copy of SubjectEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubjectEntityCopyWith<_SubjectEntity> get copyWith =>
      __$SubjectEntityCopyWithImpl<_SubjectEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubjectEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubjectEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.chapterCount, chapterCount) ||
                other.chapterCount == chapterCount) &&
            (identical(other.completedChapters, completedChapters) ||
                other.completedChapters == completedChapters) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, chapterCount, completedChapters, timeSlot);

  @override
  String toString() {
    return 'SubjectEntity(id: $id, name: $name, chapterCount: $chapterCount, completedChapters: $completedChapters, timeSlot: $timeSlot)';
  }
}

/// @nodoc
abstract mixin class _$SubjectEntityCopyWith<$Res>
    implements $SubjectEntityCopyWith<$Res> {
  factory _$SubjectEntityCopyWith(
          _SubjectEntity value, $Res Function(_SubjectEntity) _then) =
      __$SubjectEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int chapterCount,
      int completedChapters,
      String timeSlot});
}

/// @nodoc
class __$SubjectEntityCopyWithImpl<$Res>
    implements _$SubjectEntityCopyWith<$Res> {
  __$SubjectEntityCopyWithImpl(this._self, this._then);

  final _SubjectEntity _self;
  final $Res Function(_SubjectEntity) _then;

  /// Create a copy of SubjectEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? chapterCount = null,
    Object? completedChapters = null,
    Object? timeSlot = null,
  }) {
    return _then(_SubjectEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      chapterCount: null == chapterCount
          ? _self.chapterCount
          : chapterCount // ignore: cast_nullable_to_non_nullable
              as int,
      completedChapters: null == completedChapters
          ? _self.completedChapters
          : completedChapters // ignore: cast_nullable_to_non_nullable
              as int,
      timeSlot: null == timeSlot
          ? _self.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
