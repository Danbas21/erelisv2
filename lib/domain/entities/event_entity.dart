import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_entity.freezed.dart';
part 'event_entity.g.dart';

@freezed
sealed class EventEntity with _$EventEntity {
  const factory EventEntity({
    required String id,
    required String title,
    required String description,
    required DateTime date,
    @Default('') String imageUrl,
    @Default('Coming soon') String status, // Coming soon, Pendiente, Completado
  }) = _EventEntity;

  factory EventEntity.fromJson(Map<String, dynamic> json) =>
      _$EventEntityFromJson(json);
}
