// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfileModel {
  String get id;
  String get name;
  String get role;
  String? get photoUrl;
  List<SubjectModel> get subjects;

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserProfileModelCopyWith<UserProfileModel> get copyWith =>
      _$UserProfileModelCopyWithImpl<UserProfileModel>(
          this as UserProfileModel, _$identity);

  /// Serializes this UserProfileModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserProfileModel &&
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
    return 'UserProfileModel(id: $id, name: $name, role: $role, photoUrl: $photoUrl, subjects: $subjects)';
  }
}

/// @nodoc
abstract mixin class $UserProfileModelCopyWith<$Res> {
  factory $UserProfileModelCopyWith(
          UserProfileModel value, $Res Function(UserProfileModel) _then) =
      _$UserProfileModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String role,
      String? photoUrl,
      List<SubjectModel> subjects});
}

/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._self, this._then);

  final UserProfileModel _self;
  final $Res Function(UserProfileModel) _then;

  /// Create a copy of UserProfileModel
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
              as List<SubjectModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserProfileModel implements UserProfileModel {
  const _UserProfileModel(
      {required this.id,
      required this.name,
      required this.role,
      this.photoUrl,
      required final List<SubjectModel> subjects})
      : _subjects = subjects;
  factory _UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String role;
  @override
  final String? photoUrl;
  final List<SubjectModel> _subjects;
  @override
  List<SubjectModel> get subjects {
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjects);
  }

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserProfileModelCopyWith<_UserProfileModel> get copyWith =>
      __$UserProfileModelCopyWithImpl<_UserProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserProfileModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfileModel &&
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
    return 'UserProfileModel(id: $id, name: $name, role: $role, photoUrl: $photoUrl, subjects: $subjects)';
  }
}

/// @nodoc
abstract mixin class _$UserProfileModelCopyWith<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  factory _$UserProfileModelCopyWith(
          _UserProfileModel value, $Res Function(_UserProfileModel) _then) =
      __$UserProfileModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String role,
      String? photoUrl,
      List<SubjectModel> subjects});
}

/// @nodoc
class __$UserProfileModelCopyWithImpl<$Res>
    implements _$UserProfileModelCopyWith<$Res> {
  __$UserProfileModelCopyWithImpl(this._self, this._then);

  final _UserProfileModel _self;
  final $Res Function(_UserProfileModel) _then;

  /// Create a copy of UserProfileModel
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
    return _then(_UserProfileModel(
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
              as List<SubjectModel>,
    ));
  }
}

/// @nodoc
mixin _$SubjectModel {
  String get id;
  String get name;
  int get chapterCount;
  int get completedChapters;
  String get timeSlot;

  /// Create a copy of SubjectModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubjectModelCopyWith<SubjectModel> get copyWith =>
      _$SubjectModelCopyWithImpl<SubjectModel>(
          this as SubjectModel, _$identity);

  /// Serializes this SubjectModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubjectModel &&
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
    return 'SubjectModel(id: $id, name: $name, chapterCount: $chapterCount, completedChapters: $completedChapters, timeSlot: $timeSlot)';
  }
}

/// @nodoc
abstract mixin class $SubjectModelCopyWith<$Res> {
  factory $SubjectModelCopyWith(
          SubjectModel value, $Res Function(SubjectModel) _then) =
      _$SubjectModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      int chapterCount,
      int completedChapters,
      String timeSlot});
}

/// @nodoc
class _$SubjectModelCopyWithImpl<$Res> implements $SubjectModelCopyWith<$Res> {
  _$SubjectModelCopyWithImpl(this._self, this._then);

  final SubjectModel _self;
  final $Res Function(SubjectModel) _then;

  /// Create a copy of SubjectModel
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
class _SubjectModel implements SubjectModel {
  const _SubjectModel(
      {required this.id,
      required this.name,
      required this.chapterCount,
      required this.completedChapters,
      required this.timeSlot});
  factory _SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);

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

  /// Create a copy of SubjectModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubjectModelCopyWith<_SubjectModel> get copyWith =>
      __$SubjectModelCopyWithImpl<_SubjectModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubjectModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubjectModel &&
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
    return 'SubjectModel(id: $id, name: $name, chapterCount: $chapterCount, completedChapters: $completedChapters, timeSlot: $timeSlot)';
  }
}

/// @nodoc
abstract mixin class _$SubjectModelCopyWith<$Res>
    implements $SubjectModelCopyWith<$Res> {
  factory _$SubjectModelCopyWith(
          _SubjectModel value, $Res Function(_SubjectModel) _then) =
      __$SubjectModelCopyWithImpl;
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
class __$SubjectModelCopyWithImpl<$Res>
    implements _$SubjectModelCopyWith<$Res> {
  __$SubjectModelCopyWithImpl(this._self, this._then);

  final _SubjectModel _self;
  final $Res Function(_SubjectModel) _then;

  /// Create a copy of SubjectModel
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
    return _then(_SubjectModel(
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
