// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_content_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnitContentModel {
  String get id;
  String get unitId;
  String get title;
  String get text;
  List<String>? get tags;

  /// Create a copy of UnitContentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnitContentModelCopyWith<UnitContentModel> get copyWith =>
      _$UnitContentModelCopyWithImpl<UnitContentModel>(
          this as UnitContentModel, _$identity);

  /// Serializes this UnitContentModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnitContentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other.tags, tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, unitId, title, text,
      const DeepCollectionEquality().hash(tags));

  @override
  String toString() {
    return 'UnitContentModel(id: $id, unitId: $unitId, title: $title, text: $text, tags: $tags)';
  }
}

/// @nodoc
abstract mixin class $UnitContentModelCopyWith<$Res> {
  factory $UnitContentModelCopyWith(
          UnitContentModel value, $Res Function(UnitContentModel) _then) =
      _$UnitContentModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String unitId,
      String title,
      String text,
      List<String>? tags});
}

/// @nodoc
class _$UnitContentModelCopyWithImpl<$Res>
    implements $UnitContentModelCopyWith<$Res> {
  _$UnitContentModelCopyWithImpl(this._self, this._then);

  final UnitContentModel _self;
  final $Res Function(UnitContentModel) _then;

  /// Create a copy of UnitContentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? unitId = null,
    Object? title = null,
    Object? text = null,
    Object? tags = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _self.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UnitContentModel extends UnitContentModel {
  const _UnitContentModel(
      {required this.id,
      required this.unitId,
      required this.title,
      required this.text,
      final List<String>? tags})
      : _tags = tags,
        super._();
  factory _UnitContentModel.fromJson(Map<String, dynamic> json) =>
      _$UnitContentModelFromJson(json);

  @override
  final String id;
  @override
  final String unitId;
  @override
  final String title;
  @override
  final String text;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of UnitContentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UnitContentModelCopyWith<_UnitContentModel> get copyWith =>
      __$UnitContentModelCopyWithImpl<_UnitContentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UnitContentModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnitContentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, unitId, title, text,
      const DeepCollectionEquality().hash(_tags));

  @override
  String toString() {
    return 'UnitContentModel(id: $id, unitId: $unitId, title: $title, text: $text, tags: $tags)';
  }
}

/// @nodoc
abstract mixin class _$UnitContentModelCopyWith<$Res>
    implements $UnitContentModelCopyWith<$Res> {
  factory _$UnitContentModelCopyWith(
          _UnitContentModel value, $Res Function(_UnitContentModel) _then) =
      __$UnitContentModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String unitId,
      String title,
      String text,
      List<String>? tags});
}

/// @nodoc
class __$UnitContentModelCopyWithImpl<$Res>
    implements _$UnitContentModelCopyWith<$Res> {
  __$UnitContentModelCopyWithImpl(this._self, this._then);

  final _UnitContentModel _self;
  final $Res Function(_UnitContentModel) _then;

  /// Create a copy of UnitContentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? unitId = null,
    Object? title = null,
    Object? text = null,
    Object? tags = freezed,
  }) {
    return _then(_UnitContentModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _self.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      tags: freezed == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

// dart format on
