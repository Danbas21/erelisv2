// lib/services/firebase_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
