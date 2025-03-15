import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/course_entity.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<CourseEntity>> getUserCourses() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) return [];

      // Obtener los cursos en los que está inscrito el usuario
      final userDoc =
          await _firestore.collection('users').doc(currentUser.uid).get();

      if (!userDoc.exists) return [];

      final userData = userDoc.data();
      if (userData == null || !userData.containsKey('enrolledCourses')) {
        return [];
      }

      final enrolledCourses =
          List<String>.from(userData['enrolledCourses'] ?? []);
      if (enrolledCourses.isEmpty) return [];

      // Obtener los detalles de cada curso
      final coursesData = await Future.wait(
        enrolledCourses.map((courseId) async {
          final courseDoc =
              await _firestore.collection('courses').doc(courseId).get();

          if (!courseDoc.exists) return null;

          final courseData = courseDoc.data() as Map<String, dynamic>;
          courseData['id'] = courseDoc.id;

          // Obtener capítulos y tareas
          final chaptersSnapshot = await _firestore
              .collection('courses')
              .doc(courseId)
              .collection('units')
              .get();

          final chapters = chaptersSnapshot.docs.map((chapterDoc) {
            final chapterData = chapterDoc.data();
            chapterData['id'] = chapterDoc.id;
            return chapterData;
          }).toList();

          courseData['chapters'] = chapters;

          return CourseEntity.fromJson(courseData);
        }),
      );

      // Filtrar nulls y devolver la lista
      return coursesData.whereType<CourseEntity>().toList();
    } catch (e) {
      print('Error al obtener cursos: $e');
      return [];
    }
  }

  @override
  Future<CourseEntity?> getCourseById(String courseId) async {
    try {
      final courseDoc =
          await _firestore.collection('courses').doc(courseId).get();

      if (!courseDoc.exists) return null;

      final courseData = courseDoc.data() as Map<String, dynamic>;
      courseData['id'] = courseDoc.id;

      // Obtener capítulos y tareas
      final chaptersSnapshot = await _firestore
          .collection('courses')
          .doc(courseId)
          .collection('units')
          .get();

      final chapters = chaptersSnapshot.docs.map((chapterDoc) {
        final chapterData = chapterDoc.data();
        chapterData['id'] = chapterDoc.id;
        return chapterData;
      }).toList();

      courseData['chapters'] = chapters;

      return CourseEntity.fromJson(courseData);
    } catch (e) {
      print('Error al obtener curso: $e');
      return null;
    }
  }

  @override
  Future<List<TaskEntity>> getUserPendingTasks() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) return [];

      final courses = await getUserCourses();
      final List<TaskEntity> pendingTasks = [];

      for (final course in courses) {
        for (final chapter in course.chapters) {
          for (final task in chapter.tasks) {
            if (!task.isCompleted) {
              pendingTasks.add(task);
            }
          }
        }
      }

      return pendingTasks;
    } catch (e) {
      print('Error al obtener tareas pendientes: $e');
      return [];
    }
  }

  @override
  Future<void> markTaskAsCompleted(
      String courseId, String chapterId, String taskId) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) return;

      // Actualizar el estado de la tarea en el curso
      await _firestore
          .collection('courses')
          .doc(courseId)
          .collection('units')
          .doc(chapterId)
          .collection('tasks')
          .doc(taskId)
          .update({
        'isCompleted': true,
      });

      // Actualizar el progreso del usuario
      await _firestore
          .collection('users')
          .doc(currentUser.uid)
          .collection('progress')
          .doc(courseId)
          .set({
        'lastUpdated': DateTime.now().toIso8601String(),
      }, SetOptions(merge: true));
    } catch (e) {
      print('Error al marcar tarea como completada: $e');
      rethrow;
    }
  }

  @override
  Future<void> enrollUserInCourse(String courseId) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) return;

      // Añadir el curso a la lista de cursos inscritos del usuario
      await _firestore.collection('users').doc(currentUser.uid).update({
        'enrolledCourses': FieldValue.arrayUnion([courseId]),
      });

      // Crear entrada de progreso para el curso
      await _firestore
          .collection('users')
          .doc(currentUser.uid)
          .collection('progress')
          .doc(courseId)
          .set({
        'courseId': courseId,
        'progress': 0.0,
        'startDate': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      print('Error al inscribir usuario en curso: $e');
      rethrow;
    }
  }
}
