import 'package:freezed_annotation/freezed_annotation.dart';

part 'leader_entity.freezed.dart';
part 'leader_entity.g.dart';

@freezed
sealed class LeaderEntity with _$LeaderEntity {
  const factory LeaderEntity({
    required String id,
    required String name,
    required String photoUrl,
    required int score,
  }) = _LeaderEntity;

  factory LeaderEntity.fromJson(Map<String, dynamic> json) =>
      _$LeaderEntityFromJson(json);
}
