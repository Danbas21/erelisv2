import 'package:erelis/features/tablero/domain/entities/exam_entity.dart';
import 'package:erelis/features/tablero/domain/repositories/tablero_repository.dart';

class GetExamsUseCase {
  final TableroRepository repository;

  GetExamsUseCase(this.repository);

  Future<List<ExamEntity>> call() async {
    return await repository.getExams();
  }
}
