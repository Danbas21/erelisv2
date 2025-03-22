// lib/domain/usecases/get_user_highlights_usecase.dart
import '../entities/highlight.dart';
import '../repositories/highlight_repository.dart';

class GetUserHighlightsUseCase {
  final HighlightRepository repository;

  GetUserHighlightsUseCase(this.repository);

  Future<List<Highlight>> call(String unitId) {
    return repository.getUserHighlights(unitId);
  }
}
