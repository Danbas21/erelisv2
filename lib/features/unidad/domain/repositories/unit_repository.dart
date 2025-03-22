import 'package:erelis/config/result.dart';
import 'package:erelis/features/unidad/domain/entities/unit.dart';

// domain/repositories/units_repository.dart
abstract class UnitsRepository {
  Stream<Result<List<Unit>>> getUnitsByCourse(String courseId);
  Stream<Result<Unit>> getUnitById(String unitId, String courseId);
  Future<Result<List<Unit>>> getUnitsByCourseOnce(
      String courseId, String courseName);
}
