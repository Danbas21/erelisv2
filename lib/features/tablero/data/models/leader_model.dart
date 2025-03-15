import 'package:erelis/features/tablero/domain/entities/leader_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leader_model.freezed.dart';
part 'leader_model.g.dart';

@freezed
sealed class LeaderModel with _$LeaderModel {
  const factory LeaderModel({
    required String id,
    required String name,
    required String photoUrl,
    required int score,
  }) = _LeaderModel;

  factory LeaderModel.fromJson(Map<String, dynamic> json) =>
      _$LeaderModelFromJson(json);

  static LeaderModel fromEntity(LeaderEntity entity) {
    return LeaderModel(
      id: entity.id,
      name: entity.name,
      photoUrl: entity.photoUrl,
      score: entity.score,
    );
  }
}

// Extension method to convert LeaderModel to LeaderEntity
extension LeaderModelX on LeaderModel {
  LeaderEntity toEntity() {
    return LeaderEntity(id: id, name: name, photoUrl: photoUrl, score: score);
  }
}
