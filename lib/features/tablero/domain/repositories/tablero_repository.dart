import 'package:erelis/features/tablero/domain/entities/course_progress_entity.dart';
import 'package:erelis/features/tablero/domain/entities/exam_entity.dart';
import 'package:erelis/features/tablero/domain/entities/leader_entity.dart';
import 'package:erelis/features/tablero/domain/entities/user_profile_entity.dart';

abstract class TableroRepository {
  // Get the top students leaderboard
  Future<List<LeaderEntity>> getLeaders();

  // Get course progress for the current user
  Future<List<CourseProgressEntity>> getCourseProgress();

  // Get exams for the current user
  Future<List<ExamEntity>> getExams();

  // Get user profile information
  Future<UserProfileEntity> getUserProfile();

  // Update course progress (mark as completed)
  Future<void> updateCourseProgress({
    required String progressId,
    required bool completed,
  });
}
