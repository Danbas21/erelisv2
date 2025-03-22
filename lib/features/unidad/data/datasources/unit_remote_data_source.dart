// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/unit_model.dart';

abstract class UnitsRemoteDataSource {
  Stream<List<UnitModel>> getUnitsByCourse(String courseId);
  // Añadir este nuevo método
  Future<List<UnitModel>> getUnitsByCourseOnce(String courseId);
  Stream<UnitModel> getUnitById(String unitId, String courseId);
}

class UnitsRemoteDataSourceImpl implements UnitsRemoteDataSource {
  final FirebaseFirestore firestore;

  UnitsRemoteDataSourceImpl({required this.firestore});

  @override
  Stream<List<UnitModel>> getUnitsByCourse(String courseId) {
    return firestore
        .collection('courses')
        .doc(courseId)
        .collection('units')
        .snapshots()
        .map((snapshot) {
      final units = snapshot.docs.map((doc) {
        return UnitModel.fromFirestore(doc.data(), doc.id);
      }).toList();

      return units;
    });
  }

  @override
  Future<List<UnitModel>> getUnitsByCourseOnce(String courseId) async {
    try {
      final snapshot = await firestore
          .collection('courses')
          .doc(courseId)
          .collection('units')
          .get();

      final units = <UnitModel>[];

      for (var doc in snapshot.docs) {
        try {
          units.add(UnitModel.fromFirestore(doc.data(), doc.id));
        } catch (docError) {
          // Puedes elegir continuar con los otros documentos o lanzar la excepción
        }
      }

      return units;
    } catch (e) {
      throw e;
    }
  }

  Future<UnitModel> getUnitByIdOnce(String unitId) async {
    final snapshot = await firestore
        .collectionGroup('units')
        .where(FieldPath.documentId, isEqualTo: unitId)
        .get();

    if (snapshot.docs.isEmpty) {
      throw Exception("Unidad no encontrada");
    }

    final doc = snapshot.docs.first;

    return UnitModel.fromFirestore(doc.data(), doc.id);
  }

  @override
  Stream<UnitModel> getUnitById(String unitId, String courseId) {
    return firestore
        .collection('courses')
        .doc(courseId)
        .collection('units')
        .doc(unitId)
        .snapshots()
        .map((snapshot) {
      if (!snapshot.exists) {
        throw Exception('Unidad no encontrada');
      }
      return UnitModel.fromFirestore(snapshot.data()!, snapshot.id);
    }).handleError((error) {
      throw error;
    });
  }
}
