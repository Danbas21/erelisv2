// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'highlight_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HighlightModel {
  String get id;
  String get unitId;
  String get userId;
  String get text;
  int get startOffset;
  int get endOffset;
  String get colorHex;

  /// Create a copy of HighlightModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HighlightModelCopyWith<HighlightModel> get copyWith =>
      _$HighlightModelCopyWithImpl<HighlightModel>(
          this as HighlightModel, _$identity);

  /// Serializes this HighlightModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HighlightModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.startOffset, startOffset) ||
                other.startOffset == startOffset) &&
            (identical(other.endOffset, endOffset) ||
                other.endOffset == endOffset) &&
            (identical(other.colorHex, colorHex) ||
                other.colorHex == colorHex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, unitId, userId, text, startOffset, endOffset, colorHex);

  @override
  String toString() {
    return 'HighlightModel(id: $id, unitId: $unitId, userId: $userId, text: $text, startOffset: $startOffset, endOffset: $endOffset, colorHex: $colorHex)';
  }
}

/// @nodoc
abstract mixin class $HighlightModelCopyWith<$Res> {
  factory $HighlightModelCopyWith(
          HighlightModel value, $Res Function(HighlightModel) _then) =
      _$HighlightModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String unitId,
      String userId,
      String text,
      int startOffset,
      int endOffset,
      String colorHex});
}

/// @nodoc
class _$HighlightModelCopyWithImpl<$Res>
    implements $HighlightModelCopyWith<$Res> {
  _$HighlightModelCopyWithImpl(this._self, this._then);

  final HighlightModel _self;
  final $Res Function(HighlightModel) _then;

  /// Create a copy of HighlightModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? unitId = null,
    Object? userId = null,
    Object? text = null,
    Object? startOffset = null,
    Object? endOffset = null,
    Object? colorHex = null,
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
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      startOffset: null == startOffset
          ? _self.startOffset
          : startOffset // ignore: cast_nullable_to_non_nullable
              as int,
      endOffset: null == endOffset
          ? _self.endOffset
          : endOffset // ignore: cast_nullable_to_non_nullable
              as int,
      colorHex: null == colorHex
          ? _self.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _HighlightModel extends HighlightModel {
  const _HighlightModel(
      {required this.id,
      required this.unitId,
      required this.userId,
      required this.text,
      required this.startOffset,
      required this.endOffset,
      required this.colorHex})
      : super._();
  factory _HighlightModel.fromJson(Map<String, dynamic> json) =>
      _$HighlightModelFromJson(json);

  @override
  final String id;
  @override
  final String unitId;
  @override
  final String userId;
  @override
  final String text;
  @override
  final int startOffset;
  @override
  final int endOffset;
  @override
  final String colorHex;

  /// Create a copy of HighlightModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HighlightModelCopyWith<_HighlightModel> get copyWith =>
      __$HighlightModelCopyWithImpl<_HighlightModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HighlightModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HighlightModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.startOffset, startOffset) ||
                other.startOffset == startOffset) &&
            (identical(other.endOffset, endOffset) ||
                other.endOffset == endOffset) &&
            (identical(other.colorHex, colorHex) ||
                other.colorHex == colorHex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, unitId, userId, text, startOffset, endOffset, colorHex);

  @override
  String toString() {
    return 'HighlightModel(id: $id, unitId: $unitId, userId: $userId, text: $text, startOffset: $startOffset, endOffset: $endOffset, colorHex: $colorHex)';
  }
}

/// @nodoc
abstract mixin class _$HighlightModelCopyWith<$Res>
    implements $HighlightModelCopyWith<$Res> {
  factory _$HighlightModelCopyWith(
          _HighlightModel value, $Res Function(_HighlightModel) _then) =
      __$HighlightModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String unitId,
      String userId,
      String text,
      int startOffset,
      int endOffset,
      String colorHex});
}

/// @nodoc
class __$HighlightModelCopyWithImpl<$Res>
    implements _$HighlightModelCopyWith<$Res> {
  __$HighlightModelCopyWithImpl(this._self, this._then);

  final _HighlightModel _self;
  final $Res Function(_HighlightModel) _then;

  /// Create a copy of HighlightModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? unitId = null,
    Object? userId = null,
    Object? text = null,
    Object? startOffset = null,
    Object? endOffset = null,
    Object? colorHex = null,
  }) {
    return _then(_HighlightModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _self.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      startOffset: null == startOffset
          ? _self.startOffset
          : startOffset // ignore: cast_nullable_to_non_nullable
              as int,
      endOffset: null == endOffset
          ? _self.endOffset
          : endOffset // ignore: cast_nullable_to_non_nullable
              as int,
      colorHex: null == colorHex
          ? _self.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
