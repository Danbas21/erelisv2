import 'package:erelis/features/tablero/domain/entities/user_profile_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
sealed class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    required String id,
    required String name,
    required String role,
    String? photoUrl,
    required List<SubjectModel> subjects,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  static UserProfileModel fromEntity(UserProfileEntity entity) {
    return UserProfileModel(
      id: entity.id,
      name: entity.name,
      role: entity.role,
      photoUrl: entity.photoUrl,
      subjects: entity.subjects
          .map((subject) => SubjectModel.fromEntity(subject))
          .toList(),
    );
  }
}

@freezed
sealed class SubjectModel with _$SubjectModel {
  const factory SubjectModel({
    required String id,
    required String name,
    required int chapterCount,
    required int completedChapters,
    required String timeSlot,
  }) = _SubjectModel;

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);

  static SubjectModel fromEntity(SubjectEntity entity) {
    return SubjectModel(
      id: entity.id,
      name: entity.name,
      chapterCount: entity.chapterCount,
      completedChapters: entity.completedChapters,
      timeSlot: entity.timeSlot,
    );
  }
}

// Extension methods
extension UserProfileModelX on UserProfileModel {
  UserProfileEntity toEntity() {
    return UserProfileEntity(
      id: id,
      name: name,
      role: role,
      photoUrl: photoUrl,
      subjects: subjects.map((s) => s.toEntity()).toList(),
    );
  }
}

extension SubjectModelX on SubjectModel {
  SubjectEntity toEntity() {
    return SubjectEntity(
      id: id,
      name: name,
      chapterCount: chapterCount,
      completedChapters: completedChapters,
      timeSlot: timeSlot,
    );
  }
}
