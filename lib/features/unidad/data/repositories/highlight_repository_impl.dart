// lib/data/repositories/highlight_repository_impl.dart

import 'package:erelis/core/exceptions/app_exceptions.dart';
import 'package:erelis/core/exceptions/failures.dart';

import '../../domain/entities/highlight.dart';
import '../../domain/repositories/highlight_repository.dart';
import '../datasources/highlight_remote_data_source.dart';
import '../models/highlight_model.dart';

class HighlightRepositoryImpl implements HighlightRepository {
  final HighlightRemoteDataSource remoteDataSource;

  HighlightRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Highlight>> getUserHighlights(String unitId) async {
    try {
      final models = await remoteDataSource.getUserHighlights(unitId);
      return models.map((model) => model.toEntity()).toList();
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw UnexpectedFailure(e.toString());
    }
  }

  @override
  Future<void> saveHighlight(Highlight highlight) async {
    try {
      final highlightModel = HighlightModel(
        id: highlight.id,
        unitId: highlight.unitId,
        userId: highlight.userId,
        text: highlight.text,
        startOffset: highlight.startOffset,
        endOffset: highlight.endOffset,
        colorHex:
            '#${highlight.color.toARGB32().toRadixString(16).substring(2)}',
      );

      await remoteDataSource.saveHighlight(highlightModel);
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw UnexpectedFailure(e.toString());
    }
  }

  @override
  Future<void> deleteHighlight(String highlightId) async {
    try {
      await remoteDataSource.deleteHighlight(highlightId);
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw UnexpectedFailure(e.toString());
    }
  }

  @override
  Stream<List<Highlight>> getHighlightsStream(String unitId) {
    try {
      return remoteDataSource.getHighlightsStream(unitId).map(
            (models) => models.map((model) => model.toEntity()).toList(),
          );
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw UnexpectedFailure(e.toString());
    }
  }
}
