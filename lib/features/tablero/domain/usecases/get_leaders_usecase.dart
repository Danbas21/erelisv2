import 'package:erelis/features/tablero/domain/entities/leader_entity.dart';
import 'package:erelis/features/tablero/domain/repositories/tablero_repository.dart';

class GetLeadersUseCase {
  final TableroRepository repository;

  GetLeadersUseCase(this.repository);

  Future<List<LeaderEntity>> call() async {
    return await repository.getLeaders();
  }
}
