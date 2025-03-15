import 'package:erelis/features/tablero/domain/entities/exam_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam_model.freezed.dart';
part 'exam_model.g.dart';

@freezed
sealed class ExamModel with _$ExamModel {
  const factory ExamModel({
    required String id,
    required String courseId,
    required String subject,
    required int chapterNumber,
    required int pageNumber,
    required int questionCount,
    required String time,
    required ExamStatus status,
    required String userId, // Additional field for Firestore queries
  }) = _ExamModel;

  factory ExamModel.fromJson(Map<String, dynamic> json) =>
      _$ExamModelFromJson(json);

  static ExamModel fromEntity(ExamEntity entity, String userId) {
    return ExamModel(
      id: entity.id,
      courseId: entity.courseId,
      subject: entity.subject,
      chapterNumber: entity.chapterNumber,
      pageNumber: entity.pageNumber,
      questionCount: entity.questionCount,
      time: entity.time,
      status: entity.status,
      userId: userId,
    );
  }
}

// Extension method to convert ExamModel to ExamEntity
extension ExamModelX on ExamModel {
  ExamEntity toEntity() {
    return ExamEntity(
      id: id,
      courseId: courseId,
      subject: subject,
      chapterNumber: chapterNumber,
      pageNumber: pageNumber,
      questionCount: questionCount,
      time: time,
      status: status,
    );
  }
}
