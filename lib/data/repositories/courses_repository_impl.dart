import 'package:erelis/data/datasources/firebase/courses_firebase_datasource.dart';
import 'package:erelis/data/models/course_model.dart';
import 'package:erelis/domain/repositories/courses_repository.dart';

class CoursesRepositoryImpl implements CoursesRepository {
  final CoursesFirebaseDataSource remoteDataSource;

  CoursesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CourseModel>> getCourses() async {
    try {
      // En un escenario real, se obtendría la información desde Firebase
      // return await remoteDataSource.getCourses();

      // Para desarrollo, usamos datos mockeados
      return CourseModel.getMockCourses();
    } catch (e) {
      throw Exception('Error al obtener cursos: $e');
    }
  }

  @override
  Future<List<CourseModel>> getCoursesByCategory(String categoryId) async {
    try {
      // En un escenario real, se filtrarían los cursos por categoría desde Firebase
      // return await remoteDataSource.getCoursesByCategory(categoryId);

      // Para desarrollo, filtramos localmente los datos mockeados
      final allCourses = CourseModel.getMockCourses();
      return allCourses
          .where((course) => course.categoryId == categoryId)
          .toList();
    } catch (e) {
      throw Exception('Error al obtener cursos por categoría: $e');
    }
  }

  @override
  Future<List<CourseModel>> searchCourses(String query) async {
    try {
      // En un escenario real, se buscarían cursos por texto en Firebase
      // return await remoteDataSource.searchCourses(query);

      // Para desarrollo, buscamos localmente en los datos mockeados
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
      throw Exception('Error al buscar cursos: $e');
    }
  }

  @override
  Future<CourseModel?> getCourseById(String id) async {
    try {
      // En un escenario real, se obtendría un curso específico desde Firebase
      // return await remoteDataSource.getCourseById(id);

      // Para desarrollo, buscamos en los datos mockeados
      final allCourses = CourseModel.getMockCourses();
      return allCourses.firstWhere(
        (course) => course.id == id,
        orElse: () => throw Exception('Curso no encontrado'),
      );
    } catch (e) {
      throw Exception('Error al obtener curso por ID: $e');
    }
  }
}
