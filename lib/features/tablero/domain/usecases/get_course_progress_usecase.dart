import 'package:erelis/features/tablero/domain/entities/course_progress_entity.dart';
import 'package:erelis/features/tablero/domain/repositories/tablero_repository.dart';

class GetCourseProgressUseCase {
  final TableroRepository repository;

  GetCourseProgressUseCase(this.repository);

  Future<List<CourseProgressEntity>> call() async {
    return await repository.getCourseProgress();
  }
}
