import '../entities/progress_entity.dart';
import '../entities/leaderboard_entity.dart';

abstract class ProgressRepository {
  /// Obtiene el progreso del usuario en todos sus cursos
  Future<List<ProgressEntity>> getUserProgress();

  /// Actualiza el progreso del usuario en un curso específico
  Future<void> updateUserProgress(String courseId, double progressPercentage);

  /// Obtiene la tabla de clasificación global
  Future<List<LeaderboardEntry>> getLeaderboard();

  /// Obtiene la posición del usuario en la tabla de clasificación
  Future<int> getUserLeaderboardPosition();
}
