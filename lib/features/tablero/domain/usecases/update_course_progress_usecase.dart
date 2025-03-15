import 'package:erelis/features/tablero/domain/repositories/tablero_repository.dart';

class UpdateCourseProgressUseCase {
  final TableroRepository repository;

  UpdateCourseProgressUseCase(this.repository);

  Future<void> call({
    required String progressId,
    required bool completed,
  }) async {
    await repository.updateCourseProgress(
      progressId: progressId,
      completed: completed,
    );
  }
}
