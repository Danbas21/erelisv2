// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventEntity {
  String get id;
  String get title;
  String get description;
  DateTime get date;
  String get imageUrl;
  String get status;

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EventEntityCopyWith<EventEntity> get copyWith =>
      _$EventEntityCopyWithImpl<EventEntity>(this as EventEntity, _$identity);

  /// Serializes this EventEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, date, imageUrl, status);

  @override
  String toString() {
    return 'EventEntity(id: $id, title: $title, description: $description, date: $date, imageUrl: $imageUrl, status: $status)';
  }
}

/// @nodoc
abstract mixin class $EventEntityCopyWith<$Res> {
  factory $EventEntityCopyWith(
          EventEntity value, $Res Function(EventEntity) _then) =
      _$EventEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      DateTime date,
      String imageUrl,
      String status});
}

/// @nodoc
class _$EventEntityCopyWithImpl<$Res> implements $EventEntityCopyWith<$Res> {
  _$EventEntityCopyWithImpl(this._self, this._then);

  final EventEntity _self;
  final $Res Function(EventEntity) _then;

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? date = null,
    Object? imageUrl = null,
    Object? status = null,
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
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _EventEntity implements EventEntity {
  const _EventEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.date,
      this.imageUrl = '',
      this.status = 'Coming soon'});
  factory _EventEntity.fromJson(Map<String, dynamic> json) =>
      _$EventEntityFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final String status;

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EventEntityCopyWith<_EventEntity> get copyWith =>
      __$EventEntityCopyWithImpl<_EventEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EventEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, date, imageUrl, status);

  @override
  String toString() {
    return 'EventEntity(id: $id, title: $title, description: $description, date: $date, imageUrl: $imageUrl, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$EventEntityCopyWith<$Res>
    implements $EventEntityCopyWith<$Res> {
  factory _$EventEntityCopyWith(
          _EventEntity value, $Res Function(_EventEntity) _then) =
      __$EventEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      DateTime date,
      String imageUrl,
      String status});
}

/// @nodoc
class __$EventEntityCopyWithImpl<$Res> implements _$EventEntityCopyWith<$Res> {
  __$EventEntityCopyWithImpl(this._self, this._then);

  final _EventEntity _self;
  final $Res Function(_EventEntity) _then;

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? date = null,
    Object? imageUrl = null,
    Object? status = null,
  }) {
    return _then(_EventEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
