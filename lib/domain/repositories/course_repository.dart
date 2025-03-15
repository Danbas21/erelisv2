import '../entities/course_entity.dart';
import '../entities/task_entity.dart';

abstract class CourseRepository {
  /// Obtiene todos los cursos en los que está inscrito el usuario actual
  Future<List<CourseEntity>> getUserCourses();

  /// Obtiene un curso específico por su ID
  Future<CourseEntity?> getCourseById(String courseId);

  /// Obtiene las tareas pendientes del usuario para todos sus cursos
  Future<List<TaskEntity>> getUserPendingTasks();

  /// Marca una tarea como completada
  Future<void> markTaskAsCompleted(
      String courseId, String chapterId, String taskId);

  /// Inscribe al usuario en un nuevo curso
  Future<void> enrollUserInCourse(String courseId);
}
