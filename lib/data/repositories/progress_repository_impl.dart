import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/progress_entity.dart';
import '../../domain/entities/leaderboard_entity.dart';
import '../../domain/repositories/progress_repository.dart';

class ProgressRepositoryImpl implements ProgressRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<ProgressEntity>> getUserProgress() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) return [];

      final progressSnapshot = await _firestore
          .collection('users')
          .doc(currentUser.uid)
          .collection('progress')
          .get();

      final List<ProgressEntity> progressList = [];

      for (final doc in progressSnapshot.docs) {
        final data = doc.data();
        final courseId = data['courseId'] as String;

        // Obtener información del curso
        final courseDoc =
            await _firestore.collection('courses').doc(courseId).get();

        if (!courseDoc.exists) continue;

        final courseData = courseDoc.data() as Map<String, dynamic>;

        // Obtener información del capítulo actual
        final currentChapter = data.containsKey('currentChapter')
            ? data['currentChapter'] as int
            : 1;

        // Buscar el nombre del capítulo actual
        String chapterName = 'Capítulo $currentChapter';
        final chaptersSnapshot = await _firestore
            .collection('courses')
            .doc(courseId)
            .collection('units')
            .where('chapterNumber', isEqualTo: currentChapter)
            .limit(1)
            .get();

        if (chaptersSnapshot.docs.isNotEmpty) {
          chapterName = chaptersSnapshot.docs.first.data()['name'] as String;
        }

        progressList.add(ProgressEntity(
          courseId: courseId,
          courseName: courseData['name'] as String,
          chapterNumber: currentChapter,
          chapterName: chapterName,
          progressPercentage: data['progress'] as double,
        ));
      }

      return progressList;
    } catch (e) {
      print('Error al obtener progreso del usuario: $e');
      return [];
    }
  }

  @override
  Future<void> updateUserProgress(
      String courseId, double progressPercentage) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) return;

      await _firestore
          .collection('users')
          .doc(currentUser.uid)
          .collection('progress')
          .doc(courseId)
          .update({
        'progress': progressPercentage,
        'lastUpdated': DateTime.now().toIso8601String(),
      });

      // Actualizar puntaje global del usuario para la tabla de clasificación
      final userDoc =
          await _firestore.collection('users').doc(currentUser.uid).get();

      if (!userDoc.exists) return;

      final userData = userDoc.data() as Map<String, dynamic>;
      int currentScore =
          userData.containsKey('score') ? userData['score'] as int : 0;

      // Aumentar score por progreso (simple pero se puede mejorar con un algoritmo más elaborado)
      int progressPoints =
          (progressPercentage / 10).round(); // 10% de progreso = 1 punto

      await _firestore.collection('users').doc(currentUser.uid).update({
        'score': currentScore + progressPoints,
      });

      // Actualizar tabla de clasificación
      await _firestore.collection('leaderboard').doc(currentUser.uid).set({
        'userId': currentUser.uid,
        'name': userData['name'],
        'photoUrl': userData['photoUrl'] ?? '',
        'score': currentScore + progressPoints,
        'lastUpdated': DateTime.now().toIso8601String(),
      }, SetOptions(merge: true));
    } catch (e) {
      print('Error al actualizar progreso del usuario: $e');
      rethrow;
    }
  }

  @override
  Future<List<LeaderboardEntry>> getLeaderboard() async {
    try {
      final leaderboardSnapshot = await _firestore
          .collection('leaderboard')
          .orderBy('score', descending: true)
          .limit(10)
          .get();

      return leaderboardSnapshot.docs.map((doc) {
        final data = doc.data();
        return LeaderboardEntry(
          userId: data['userId'] as String,
          name: data['name'] as String,
          photoUrl: data['photoUrl'] as String? ?? '',
          score: data['score'] as int,
        );
      }).toList();
    } catch (e) {
      print('Error al obtener tabla de clasificación: $e');
      return [];
    }
  }

  @override
  Future<int> getUserLeaderboardPosition() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) return 0;

      // Obtener puntaje del usuario
      final userDoc =
          await _firestore.collection('leaderboard').doc(currentUser.uid).get();

      if (!userDoc.exists) return 0;

      final userData = userDoc.data() as Map<String, dynamic>;
      final userScore = userData['score'] as int;

      // Contar cuántos usuarios tienen un puntaje superior
      final betterUsersCount = await _firestore
          .collection('leaderboard')
          .where('score', isGreaterThan: userScore)
          .count()
          .get();

      // La posición es el número de usuarios con mejor puntaje + 1
      return (betterUsersCount.count ?? 0) + 1;
    } catch (e) {
      print('Error al obtener posición en la tabla de clasificación: $e');
      return 0;
    }
  }
}
