// lib/features/test/data/repositories/question_repository_impl.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/models/question.dart';
import '../../domain/repositories/question_repository.dart';

extension FirestoreDocumentExtension on DocumentSnapshot {
  Map<String, dynamic> toMap() {
    final data = this.data() as Map<String, dynamic>;
    // Agrega el ID al mapa
    data['id'] = id;
    return data;
  }

  // Método genérico para convertir a cualquier modelo
  T toModel<T>(T Function(Map<String, dynamic>) fromJson) {
    return fromJson(toMap());
  }
}

class QuestionRepositoryImpl implements QuestionRepository {
  final FirebaseFirestore firestore;

  QuestionRepositoryImpl({required this.firestore});

  @override
  Future<List<Question>> getQuestions(String courseId, String unitId) async {
    try {
      final questionsSnapshot = await firestore
          .collection('courses')
          .doc(courseId)
          .collection('units')
          .doc(unitId)
          .collection('questions')
          .orderBy('order')
          .get();

      return questionsSnapshot.docs
          .map((doc) => doc.toModel(Question.fromJson))
          .toList();
    } catch (e) {
      throw Exception('Error al cargar las preguntas: $e');
    }
  }

  @override
  Future<void> saveUserProgress(
    String courseId,
    String unitId,
    String userId,
    Map<String, int> answers,
  ) async {
    try {
      await firestore
          .collection('users')
          .doc(userId)
          .collection('progress')
          .doc('$courseId-$unitId')
          .set({
        'courseId': courseId,
        'unitId': unitId,
        'answers': answers,
        'lastUpdated': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Error al guardar el progreso: $e');
    }
  }
}
