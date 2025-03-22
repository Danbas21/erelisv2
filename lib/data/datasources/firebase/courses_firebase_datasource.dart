import 'package:erelis/data/models/course_model.dart';

class CoursesFirebaseDataSource {
  // En un escenario real, estas funciones interactuarían con Firestore
  // Para desarrollo, se han simulado los comportamientos

  Future<List<CourseModel>> getCourses() async {
    try {
      // Simulamos la obtención de datos de Firestore
      // final snapshot = await _firestore.collection(_collectionName).get();
      // return snapshot.docs.map((doc) => CourseModel.fromJson(doc.data())).toList();

      // Para desarrollo, simulamos un retraso en la red
      await Future.delayed(Duration(milliseconds: 800));
      return CourseModel.getMockCourses();
    } catch (e) {
      throw Exception('Error al obtener cursos desde Firebase: $e');
    }
  }

  Future<List<CourseModel>> getCoursesByCategory(String categoryId) async {
    try {
      // Simulamos la obtención de datos filtrados de Firestore
      // final snapshot = await _firestore
      //     .collection(_collectionName)
      //     .where('categoryId', isEqualTo: categoryId)
      //     .get();
      // return snapshot.docs.map((doc) => CourseModel.fromJson(doc.data())).toList();

      // Para desarrollo, simulamos un retraso en la red
      await Future.delayed(Duration(milliseconds: 600));

      final allCourses = CourseModel.getMockCourses();
      return allCourses
          .where((course) => course.categoryId == categoryId)
          .toList();
    } catch (e) {
      throw Exception(
        'Error al obtener cursos por categoría desde Firebase: $e',
      );
    }
  }

  Future<List<CourseModel>> searchCourses(String query) async {
    try {
      // En Firestore real, podríamos usar alguna solución como Algolia o
      // filtrar los resultados manualmente después de obtener todos los cursos

      // Para desarrollo, simulamos un retraso en la red
      await Future.delayed(Duration(milliseconds: 700));

      final allCourses = CourseModel.getMockCourses();
      final searchQuery = query.toLowerCase();

      return allCourses
          .where(
            (course) =>
                course.title.toLowerCase().contains(searchQuery) ||
                course.description.toLowerCase().contains(searchQuery),
          )
          .toList();
    } catch (e) {
      throw Exception('Error al buscar cursos desde Firebase: $e');
    }
  }

  Future<CourseModel?> getCourseById(String id) async {
    try {
      // Simulamos la obtención de un documento específico de Firestore
      // final doc = await _firestore.collection(_collectionName).doc(id).get();
      // if (doc.exists) {
      //   return CourseModel.fromJson(doc.data()!);
      // }
      // return null;

      // Para desarrollo, simulamos un retraso en la red
      await Future.delayed(Duration(milliseconds: 500));

      final allCourses = CourseModel.getMockCourses();
      try {
        return allCourses.firstWhere((course) => course.id == id);
      } catch (e) {
        return null; // Curso no encontrado
      }
    } catch (e) {
      throw Exception('Error al obtener curso por ID desde Firebase: $e');
    }
  }
}
