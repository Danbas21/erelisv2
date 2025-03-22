import '../models/question.dart';

abstract class QuestionRepository {
  Future<List<Question>> getQuestions(String courseId, String unitId);
  Future<void> saveUserProgress(
      String courseId, String unitId, String userId, Map<String, int> answers);
}
