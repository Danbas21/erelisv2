import 'package:freezed_annotation/freezed_annotation.dart';
import 'task_entity.dart';

part 'chapter_entity.freezed.dart';
part 'chapter_entity.g.dart';

@freezed
sealed class ChapterEntity with _$ChapterEntity {
  const factory ChapterEntity({
    required String id,
    required String name,
    required int chapterNumber,
    @Default(false) bool isCompleted,
    @Default([]) List<TaskEntity> tasks,
  }) = _ChapterEntity;

  factory ChapterEntity.fromJson(Map<String, dynamic> json) =>
      _$ChapterEntityFromJson(json);
}
