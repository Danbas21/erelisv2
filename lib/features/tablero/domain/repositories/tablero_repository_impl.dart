import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:erelis/features/tablero/data/models/course_progress_model.dart';
import 'package:erelis/features/tablero/data/models/exam_model.dart';
import 'package:erelis/features/tablero/data/models/leader_model.dart';
import 'package:erelis/features/tablero/data/models/user_profile_model.dart';
import 'package:erelis/features/tablero/domain/entities/course_progress_entity.dart';
import 'package:erelis/features/tablero/domain/entities/exam_entity.dart';
import 'package:erelis/features/tablero/domain/entities/leader_entity.dart';
import 'package:erelis/features/tablero/domain/entities/user_profile_entity.dart';
import 'package:erelis/features/tablero/domain/repositories/tablero_repository.dart';

class TableroRepositoryImpl implements TableroRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  TableroRepositoryImpl({
    required this.firestore,
    required this.auth,
  });

  String get currentUserId => auth.currentUser?.uid ?? '';

  @override
  Future<List<LeaderEntity>> getLeaders() async {
    try {
      // Get the leaders ordered by score (descending)
      final snapshot = await firestore
          .collection('users')
          .orderBy('score', descending: true)
          .limit(10) // Only get top 10 users
          .get();

      return snapshot.docs
          .map((doc) => LeaderModel.fromJson({
                'id': doc.id,
                ...doc.data(),
              }) as LeaderEntity)
          .toList();
    } catch (e) {
      throw Exception('Failed to get leaders: $e');
    }
  }

  @override
  Future<List<CourseProgressEntity>> getCourseProgress() async {
    try {
      final snapshot = await firestore
          .collection('course_progress')
          .where('userId', isEqualTo: currentUserId)
          .get();

      return snapshot.docs
          .map((doc) => CourseProgressModel.fromJson({
                'id': doc.id,
                ...doc.data(),
              }) as CourseProgressEntity)
          .toList();
    } catch (e) {
      throw Exception('Failed to get course progress: $e');
    }
  }

  @override
  Future<List<ExamEntity>> getExams() async {
    try {
      final snapshot = await firestore
          .collection('exams')
          .where('userId', isEqualTo: currentUserId)
          .get();

      return snapshot.docs
          .map((doc) => ExamModel.fromJson({
                'id': doc.id,
                ...doc.data(),
              }) as ExamEntity)
          .toList();
    } catch (e) {
      throw Exception('Failed to get exams: $e');
    }
  }

  @override
  Future<UserProfileEntity> getUserProfile() async {
    try {
      final userDoc =
          await firestore.collection('users').doc(currentUserId).get();

      if (!userDoc.exists) {
        throw Exception('User profile not found');
      }

      // Get the user's subjects
      final subjectsSnapshot = await firestore
          .collection('subjects')
          .where('userId', isEqualTo: currentUserId)
          .get();

      final subjects = subjectsSnapshot.docs
          .map((doc) => SubjectModel.fromJson({
                'id': doc.id,
                ...doc.data(),
              }))
          .toList();

      return UserProfileModel.fromJson({
        'id': userDoc.id,
        ...userDoc.data() ?? {},
        'subjects': subjects.map((s) => s.toJson()).toList(),
      }) as UserProfileEntity;
    } catch (e) {
      throw Exception('Failed to get user profile: $e');
    }
  }

  @override
  Future<void> updateCourseProgress({
    required String progressId,
    required bool completed,
  }) async {
    try {
      // Calculate new progress percentage
      // Assuming 100% if completed, or leave as is
      double newPercentage = completed ? 100.0 : 0.0;

      // If we need more complex logic, we would fetch the existing progress first
      // and then update it with a new calculation

      await firestore.collection('course_progress').doc(progressId).update({
        'progressPercentage': newPercentage,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to update course progress: $e');
    }
  }
}
