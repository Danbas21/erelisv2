import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erelis/core/constants/app_constants.dart';
import 'package:erelis/core/exceptions/app_exceptions.dart';
import 'package:erelis/core/utils/firebase_utils.dart';

import '../models/highlight_model.dart';

class HighlightRemoteDataSource {
  final FirebaseFirestore firestore;

  HighlightRemoteDataSource({required this.firestore});

  Future<List<HighlightModel>> getUserHighlights(String unitId) async {
    try {
      final userId = FirebaseUtils.currentUserId;

      final querySnapshot = await firestore
          .collection(AppConstants.highlightsCollection)
          .where('userId', isEqualTo: userId)
          .where('unitId', isEqualTo: unitId)
          .get();

      return querySnapshot.docs
          .map((doc) => HighlightModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw ServerException(message: 'Error fetching highlights: $e');
    }
  }

  Future<void> saveHighlight(HighlightModel highlight) async {
    try {
      await firestore
          .collection(AppConstants.highlightsCollection)
          .doc(highlight.id)
          .set(highlight.toJson());
    } catch (e) {
      throw ServerException(message: 'Error saving highlight: $e');
    }
  }

  Future<void> deleteHighlight(String highlightId) async {
    try {
      await firestore
          .collection(AppConstants.highlightsCollection)
          .doc(highlightId)
          .delete();
    } catch (e) {
      throw ServerException(message: 'Error deleting highlight: $e');
    }
  }

  Stream<List<HighlightModel>> getHighlightsStream(String unitId) {
    try {
      final userId = FirebaseUtils.currentUserId;

      return firestore
          .collection(AppConstants.highlightsCollection)
          .where('userId', isEqualTo: userId)
          .where('unitId', isEqualTo: unitId)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => HighlightModel.fromFirestore(doc))
              .toList());
    } catch (e) {
      throw ServerException(message: 'Error streaming highlights: $e');
    }
  }
}
