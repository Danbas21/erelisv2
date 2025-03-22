// lib/services/firebase_service.dart
import 'dart:typed_data';

import 'package:erelis/core/constants/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
// lib/core/services/firebase_service.dart (extensión del existente)

class FirebaseService {
  // Instancias de Firebase
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  // Auth providers
  final GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();

  FirebaseService() {
    // Configurar el proveedor de Google para solicitar el perfil del usuario y el email
    googleAuthProvider.addScope('profile');
    googleAuthProvider.addScope('email');
    googleAuthProvider.setCustomParameters({'login_hint': 'user@example.com'});
  }
}

extension FirebaseServiceExtension on FirebaseService {
  // Método para obtener el ID del usuario actual
  String? get currentUserId => auth.currentUser?.uid;

  // Método para verificar si hay un usuario autenticado
  bool get isUserLoggedIn => auth.currentUser != null;

  // Crear referencia a una colección con ID de usuario
  CollectionReference getUserCollection(String collectionPath) {
    final userId = currentUserId;
    if (userId == null) {
      throw Exception('No user logged in');
    }
    return firestore
        .collection(AppConstants.usersCollection)
        .doc(userId)
        .collection(collectionPath);
  }

  // Subir archivo a Storage y obtener la URL
  Future<String> uploadFile(
    String path,
    List<int> bytes, {
    String contentType = 'application/octet-stream',
  }) async {
    final storageRef = storage.ref().child(path);
    final uploadTask = storageRef.putData(
      Uint8List.fromList(bytes),
      SettableMetadata(contentType: contentType),
    );

    final snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }

  // Obtener datos de usuario actual
  Future<Map<String, dynamic>?> getCurrentUserData() async {
    final userId = currentUserId;
    if (userId == null) return null;

    final docSnapshot = await firestore
        .collection(AppConstants.usersCollection)
        .doc(userId)
        .get();

    if (docSnapshot.exists) {
      return docSnapshot.data();
    }
    return null;
  }
}
