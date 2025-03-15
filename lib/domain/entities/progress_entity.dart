import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_entity.freezed.dart';
part 'progress_entity.g.dart';

@freezed
sealed class ProgressEntity with _$ProgressEntity {
  const factory ProgressEntity({
    required String courseId,
    required String courseName,
    required int chapterNumber,
    required String chapterName,
    required double progressPercentage,
  }) = _ProgressEntity;

  factory ProgressEntity.fromJson(Map<String, dynamic> json) =>
      _$ProgressEntityFromJson(json);
}
