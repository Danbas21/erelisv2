// lib/features/salon/data/datasources/subjects_firebase_datasource.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erelis/features/salon/domain/models/subject_model.dart';

class SubjectsFirebaseDataSource {
  final FirebaseFirestore _firestore;

  SubjectsFirebaseDataSource({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  Future<List<SubjectModel>> getSubjects() async {
    try {
      final querySnapshot = await _firestore.collection('subjects').get();

      if (querySnapshot.docs.isEmpty) {
        // If the collection doesn't exist or is empty, return default subjects
        return _getDefaultSubjects();
      }

      return querySnapshot.docs
          .map((doc) => SubjectModel.fromJson({
                'id': doc.id,
                ...doc.data(),
              }))
          .toList();
    } catch (e) {
      print('Error fetching subjects: $e');
      // Return default subjects in case of error
      return _getDefaultSubjects();
    }
  }

  // Default subjects if Firestore collection doesn't exist
  List<SubjectModel> _getDefaultSubjects() {
    return [
      SubjectModel(
        id: '1',
        name: 'Matemáticas',
        imageUrl: 'assets/images/subjects/math.png',
        isEnabled: true,
      ),
      SubjectModel(
        id: '2',
        name: 'Química',
        imageUrl: 'assets/images/subjects/chemistry.png',
        isEnabled: true,
      ),
      SubjectModel(
        id: '3',
        name: 'Física',
        imageUrl: 'assets/images/subjects/physics.png',
        isEnabled: true,
      ),
      SubjectModel(
        id: '4',
        name: 'Biología',
        imageUrl: 'assets/images/subjects/biology.png',
        isEnabled: true,
      ),
      SubjectModel(
        id: '5',
        name: 'Habilidad Verbal',
        imageUrl: 'assets/images/subjects/verbal.png',
        isEnabled: true,
      ),
      SubjectModel(
        id: '6',
        name: 'Historia Universal',
        imageUrl: 'assets/images/subjects/history.png',
        isEnabled: true,
      ),
      SubjectModel(
        id: '7',
        name: 'Civismo',
        imageUrl: 'assets/images/subjects/civics.png',
        isEnabled: true,
      ),
      SubjectModel(
        id: '8',
        name: 'Geografía',
        imageUrl: 'assets/images/subjects/geography.png',
        isEnabled: true,
      ),
      SubjectModel(
        id: '9',
        name: 'Español',
        imageUrl: 'assets/images/subjects/spanish.png',
        isEnabled: true,
      ),
      SubjectModel(
        id: '10',
        name: 'Historia de México',
        imageUrl: 'assets/images/subjects/mexico_history.png',
        isEnabled: true,
      ),
      SubjectModel(
        id: '11',
        name: 'Habilidad Matemática',
        imageUrl: 'assets/images/subjects/math_skills.png',
        isEnabled: true,
      ),
    ];
  }
}
