import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_progress_entity.freezed.dart';
part 'course_progress_entity.g.dart';

@freezed
sealed class CourseProgressEntity with _$CourseProgressEntity {
  const factory CourseProgressEntity({
    required String id,
    required String courseId,
    required String chapterName,
    required int chapterNumber,
    required double progressPercentage,
  }) = _CourseProgressEntity;

  factory CourseProgressEntity.fromJson(Map<String, dynamic> json) =>
      _$CourseProgressEntityFromJson(json);
}
