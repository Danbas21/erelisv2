import 'package:erelis/data/models/course_model.dart';

abstract class CoursesRepository {
  Future<List<CourseModel>> getCourses();
  Future<List<CourseModel>> getCoursesByCategory(String categoryId);
  Future<List<CourseModel>> searchCourses(String query);
  Future<CourseModel?> getCourseById(String id);
}
