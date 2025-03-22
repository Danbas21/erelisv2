// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erelis/config/failures.dart';
import 'package:erelis/features/unidad/data/datasources/unit_remote_data_source.dart';

import 'package:erelis/features/unidad/domain/entities/unit.dart';
import 'package:erelis/features/unidad/domain/repositories/unit_repository.dart';
import '../../../../config/result.dart';
import '../../domain/entities/unit.dart' as domain;
// data/repositories/units_repository_impl.dart

class UnitsRepositoryImpl implements UnitsRepository {
  final UnitsRemoteDataSource remoteDataSource;

  UnitsRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<Result<List<Unit>>> getUnitsByCourse(String courseId) {
    return remoteDataSource.getUnitsByCourse(courseId).map((models) {
      // Conversión explícita a List<Unit>
      final List<Unit> unitEntities = models
          .map<domain.Unit>((model) => model.toEntity())
          .toList(); // Asegura que el tipo sea correcto

      return Result<List<Unit>>(data: unitEntities);
    }).handleError((error) {
      return Result<List<domain.Unit>>(error: Exception(error.toString()));
    });
  }

// data/datasources/units_remote_data_source.dart
  @override
  Stream<Result<Unit>> getUnitById(String unitId, String courseId) {
    return remoteDataSource.getUnitById(unitId, courseId).map((unit) {
      return Success<Unit>(unit.toEntity());
    }).handleError((error) {
      return Error<Unit>(ServerFailure());
    });
  }

  Future<void> debugCheckUnits(String courseId) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(courseId)
          .collection('units')
          .get();

      if (snapshot.docs.isEmpty) {
      } else {}
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  Future<Result<List<Unit>>> getUnitsByCourseOnce(
      String courseId, String courseName) async {
    try {
      final models = await remoteDataSource.getUnitsByCourseOnce(courseId);

      final List<Unit> unitEntities =
          models.map<Unit>((model) => model.toEntity()).toList();

      return Result<List<Unit>>(data: unitEntities);
    } catch (e) {
      return Result<List<Unit>>(error: Exception(e.toString()));
    }
  }
}
