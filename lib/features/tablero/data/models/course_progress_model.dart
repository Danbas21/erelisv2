import 'package:erelis/features/tablero/domain/entities/course_progress_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_progress_model.freezed.dart';
part 'course_progress_model.g.dart';

@freezed
sealed class CourseProgressModel with _$CourseProgressModel {
  const factory CourseProgressModel({
    required String id,
    required String courseId,
    required String chapterName,
    required int chapterNumber,
    required double progressPercentage,
    required String userId, // Additional field for Firestore queries
  }) = _CourseProgressModel;

  factory CourseProgressModel.fromJson(Map<String, dynamic> json) =>
      _$CourseProgressModelFromJson(json);

  static CourseProgressModel fromEntity(
      CourseProgressEntity entity, String userId) {
    return CourseProgressModel(
      id: entity.id,
      courseId: entity.courseId,
      chapterName: entity.chapterName,
      chapterNumber: entity.chapterNumber,
      progressPercentage: entity.progressPercentage,
      userId: userId,
    );
  }
}

// Extension method to convert CourseProgressModel to CourseProgressEntity
extension CourseProgressModelX on CourseProgressModel {
  CourseProgressEntity toEntity() {
    return CourseProgressEntity(
      id: id,
      courseId: courseId,
      chapterName: chapterName,
      chapterNumber: chapterNumber,
      progressPercentage: progressPercentage,
    );
  }
}
