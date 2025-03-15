import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam_entity.freezed.dart';
part 'exam_entity.g.dart';

enum ExamStatus {
  pending,
  completed,
}

@freezed
sealed class ExamEntity with _$ExamEntity {
  const factory ExamEntity({
    required String id,
    required String courseId,
    required String subject,
    required int chapterNumber,
    required int pageNumber,
    required int questionCount,
    required String time,
    required ExamStatus status,
  }) = _ExamEntity;

  factory ExamEntity.fromJson(Map<String, dynamic> json) =>
      _$ExamEntityFromJson(json);
}
