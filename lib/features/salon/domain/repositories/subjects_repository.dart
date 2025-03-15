// lib/features/salon/domain/repositories/subjects_repository.dart
import 'package:erelis/features/salon/domain/models/subject_model.dart';

abstract class SubjectsRepository {
  Future<List<SubjectModel>> getSubjects();
}
