// lib/features/test/domain/models/test.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'test.freezed.dart';
part 'test.g.dart';

@freezed
sealed class Test with _$Test {
  const factory Test({
    required String id,
    required String title,
    required String courseId,
    required String unitId,
    required int questionCount,
    @Default(30) int timeLimit,
    @Default('') String description,
    @Default(false) bool hasAttempted,
    @Default(false) bool isPassed,
    @Default(0.0) double lastScore,
  }) = _Test;

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);
}
