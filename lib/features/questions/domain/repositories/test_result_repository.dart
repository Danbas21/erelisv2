import '../models/question.dart';

abstract class TestResultRepository {
  Future<void> saveTestResult(TestResult result);
  Future<List<TestResult>> getUserTestResults(String userId);
  Future<TestResult?> getTestResult(
      String userId, String courseId, String unitId);
}
