// lib/domain/usecases/save_highlight_usecase.dart
import '../entities/highlight.dart';
import '../repositories/highlight_repository.dart';

class SaveHighlightUseCase {
  final HighlightRepository repository;

  SaveHighlightUseCase(this.repository);

  Future<void> call(Highlight highlight) {
    return repository.saveHighlight(highlight);
  }
}
