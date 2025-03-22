// lib/core/utils/firebase_utils.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erelis/core/exceptions/app_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUtils {
  static String get currentUserId {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw UnauthorizedException(
        message: 'No user is currently logged in',
      );
    }
    return user.uid;
  }

  static Future<void> ensureCollectionExists(
      FirebaseFirestore firestore, String collectionPath,
      [Map<String, dynamic>? defaultData]) async {
    final collectionRef = firestore.collection(collectionPath);
    final snapshot = await collectionRef.limit(1).get();

    if (snapshot.docs.isEmpty && defaultData != null) {
      await collectionRef.add(defaultData);
    }
  }

  static DateTime timestampToDateTime(dynamic timestamp) {
    if (timestamp is Timestamp) {
      return timestamp.toDate();
    } else if (timestamp is DateTime) {
      return timestamp;
    }
    return DateTime.now();
  }

  static Stream<QuerySnapshot> getPaginatedCollectionStream(
    CollectionReference collectionRef, {
    int limit = 10,
    String? orderBy,
    bool descending = false,
    DocumentSnapshot? startAfterDoc,
  }) {
    Query query = collectionRef;

    if (orderBy != null) {
      query = query.orderBy(orderBy, descending: descending);
    }

    if (startAfterDoc != null) {
      query = query.startAfterDocument(startAfterDoc);
    }

    return query.limit(limit).snapshots();
  }
}
