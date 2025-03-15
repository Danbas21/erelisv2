import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_entity.freezed.dart';
part 'user_profile_entity.g.dart';

@freezed
sealed class UserProfileEntity with _$UserProfileEntity {
  const factory UserProfileEntity({
    required String id,
    required String name,
    required String role,
    String? photoUrl,
    required List<SubjectEntity> subjects,
  }) = _UserProfileEntity;

  factory UserProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$UserProfileEntityFromJson(json);
}

@freezed
sealed class SubjectEntity with _$SubjectEntity {
  const factory SubjectEntity({
    required String id,
    required String name,
    required int chapterCount,
    required int completedChapters,
    required String timeSlot,
  }) = _SubjectEntity;

  factory SubjectEntity.fromJson(Map<String, dynamic> json) =>
      _$SubjectEntityFromJson(json);
}
