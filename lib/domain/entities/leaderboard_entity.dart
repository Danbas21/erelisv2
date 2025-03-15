import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_entity.freezed.dart';
part 'leaderboard_entity.g.dart';

@freezed
sealed class LeaderboardEntry with _$LeaderboardEntry {
  const factory LeaderboardEntry({
    required String userId,
    required String name,
    @Default('') String photoUrl,
    required int score,
  }) = _LeaderboardEntry;

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardEntryFromJson(json);
}
