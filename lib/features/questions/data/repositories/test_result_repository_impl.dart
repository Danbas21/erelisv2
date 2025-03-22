// lib/features/test/data/repositories/test_result_repository_impl.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/models/question.dart';
import '../../domain/repositories/test_result_repository.dart';

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

class TestResultRepositoryImpl implements TestResultRepository {
  final FirebaseFirestore firestore;

  TestResultRepositoryImpl({required this.firestore});

  @override
  Future<void> saveTestResult(TestResult result) async {
    try {
      // Creamos un ID para el test si no existe
      final docRef = firestore.collection('test_results').doc();
      final resultWithId = result.copyWith(
        testId: result.testId.isEmpty ? docRef.id : result.testId,
      );

      await docRef.set(resultWithId.toJson());
    } catch (e) {
      throw Exception('Error al guardar el resultado del test: $e');
    }
  }

  @override
  Future<List<TestResult>> getUserTestResults(String userId) async {
    try {
      final snapshot = await firestore
          .collection('test_results')
          .where('userId', isEqualTo: userId)
          .orderBy('completedAt', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => doc.toModel(TestResult.fromJson))
          .toList();
    } catch (e) {
      throw Exception('Error al obtener resultados del usuario: $e');
    }
  }

  @override
  Future<TestResult?> getTestResult(
    String userId,
    String courseId,
    String unitId,
  ) async {
    try {
      final snapshot = await firestore
          .collection('test_results')
          .where('userId', isEqualTo: userId)
          .where('courseId', isEqualTo: courseId)
          .where('unitId', isEqualTo: unitId)
          .limit(1)
          .get();

      if (snapshot.docs.isEmpty) {
        return null;
      }

      return snapshot.docs.first.toModel(TestResult.fromJson);
    } catch (e) {
      throw Exception('Error al obtener el resultado del test: $e');
    }
  }
}
