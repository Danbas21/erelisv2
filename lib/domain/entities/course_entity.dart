import 'package:freezed_annotation/freezed_annotation.dart';
import 'chapter_entity.dart';

part 'course_entity.freezed.dart';
part 'course_entity.g.dart';

@freezed
sealed class CourseEntity with _$CourseEntity {
  const factory CourseEntity({
    required String id,
    required String name,
    required String description,
    required int totalChapters,
    @Default(0) int completedChapters,
    required String startTime,
    required String endTime,
    @Default([]) List<ChapterEntity> chapters,
  }) = _CourseEntity;

  factory CourseEntity.fromJson(Map<String, dynamic> json) =>
      _$CourseEntityFromJson(json);
}
