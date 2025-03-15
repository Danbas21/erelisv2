import 'package:erelis/features/salon/data/datasources/subjects_firebase_datasource.dart';
import 'package:erelis/features/salon/domain/models/subject_model.dart';
import 'package:erelis/features/salon/domain/repositories/subjects_repository.dart';

class SubjectsRepositoryImpl implements SubjectsRepository {
  final SubjectsFirebaseDataSource _remoteDataSource;

  SubjectsRepositoryImpl({
    required SubjectsFirebaseDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<List<SubjectModel>> getSubjects() async {
    return await _remoteDataSource.getSubjects();
  }
}
