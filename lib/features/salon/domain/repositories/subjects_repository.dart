// lib/features/salon/domain/repositories/subjects_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erelis/features/salon/domain/models/subject_model.dart';

// return doc.toModel(Employee.fromJson);
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

class SubjectsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'courses';

  Future<List<SubjectModel>> getCoursesAsList() async {
    print("Fetching courses...");
    final snapshot = await _firestore.collection(_collectionName).get();
    final courses = snapshot.docs.map((doc) {
      print("Document data: ${doc.data()}");
      return doc.toModel(SubjectModel.fromJson);
    }).toList();
    print("Fetched ${courses.length} courses");
    return courses;
  }

  Stream<List<SubjectModel>> getCoursesStream() {
    return _firestore.collection(_collectionName).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return doc.toModel(SubjectModel.fromJson);
      }).toList();
    });
  }

  // Obtener un curso específico por ID
  Future<SubjectModel> getCourseById(String courseId) async {
    final docSnapshot =
        await _firestore.collection(_collectionName).doc(courseId).get();
    try {
      if (!docSnapshot.exists) {
        throw Exception('No se encontró el curso con ID: $courseId');
      }
      final data = docSnapshot.data()!;

      return SubjectModel.fromJson(data);
    } catch (e) {
      print('Error completo al obtener curso: $e');
      throw Exception('Error al obtener el curso: ${e.toString()}');
    }
  }

  // Añadir un nuevo curso
  Future<void> addCourse(SubjectModel course) async {
    try {
      await _firestore.collection(_collectionName).add(course.toJson());
    } catch (e) {
      throw Exception('Error al añadir el curso: ${e.toString()}');
    }
  }

  // Actualizar un curso existente
  Future<void> updateCourse(SubjectModel course) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(course.id)
          .update(course.toJson());
    } catch (e) {
      throw Exception('Error al actualizar el curso: ${e.toString()}');
    }
  }

  // Eliminar un curso
  Future<void> deleteCourse(String courseId) async {
    try {
      await _firestore.collection(_collectionName).doc(courseId).delete();
    } catch (e) {
      throw Exception('Error al eliminar el curso: ${e.toString()}');
    }
  }
}
