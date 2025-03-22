import 'package:erelis/features/unidad/domain/entities/highlight.dart';

abstract class HighlightRepository {
  Future<List<Highlight>> getUserHighlights(String unitId);
  Future<void> saveHighlight(Highlight highlight);
  Future<void> deleteHighlight(String highlightId);
  Stream<List<Highlight>> getHighlightsStream(String unitId);
}
