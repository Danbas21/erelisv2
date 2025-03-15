// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubjectModel {
  String get id;
  String get name;
  String get imageUrl;
  bool get isEnabled;

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
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl, isEnabled);

  @override
  String toString() {
    return 'SubjectModel(id: $id, name: $name, imageUrl: $imageUrl, isEnabled: $isEnabled)';
  }
}

/// @nodoc
abstract mixin class $SubjectModelCopyWith<$Res> {
  factory $SubjectModelCopyWith(
          SubjectModel value, $Res Function(SubjectModel) _then) =
      _$SubjectModelCopyWithImpl;
  @useResult
  $Res call({String id, String name, String imageUrl, bool isEnabled});
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
    Object? imageUrl = null,
    Object? isEnabled = null,
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
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isEnabled: null == isEnabled
          ? _self.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SubjectModel implements SubjectModel {
  _SubjectModel(
      {required this.id,
      required this.name,
      required this.imageUrl,
      this.isEnabled = false});
  factory _SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  @JsonKey()
  final bool isEnabled;

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
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl, isEnabled);

  @override
  String toString() {
    return 'SubjectModel(id: $id, name: $name, imageUrl: $imageUrl, isEnabled: $isEnabled)';
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
  $Res call({String id, String name, String imageUrl, bool isEnabled});
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
    Object? imageUrl = null,
    Object? isEnabled = null,
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
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isEnabled: null == isEnabled
          ? _self.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
