import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erelis/data/models/user_model.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthRepository({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  // Método para login con email y password
  Future<String> loginWithEmail(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // El ! es seguro aquí porque si la autenticación tiene éxito, siempre tendremos un user
      return userCredential.user!.uid;
    } catch (e) {
      throw Exception('Error en inicio de sesión: ${e.toString()}');
    }
  }

  // Método para login con Google
  Future<String> loginWithGoogle() async {
    try {
      // Implementación del login con Google
      // ...

      // Asumiendo que obtienes un userCredential
      final User? user = _firebaseAuth.currentUser;

      if (user == null) {
        throw Exception(
            'No se pudo obtener usuario después del login con Google');
      }

      return user.uid;
    } catch (e) {
      throw Exception('Error en inicio de sesión con Google: ${e.toString()}');
    }
  }

  // Método para cerrar sesión
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Error al cerrar sesión: ${e.toString()}');
    }
  }

  // Método para verificar autorización

  Future<UserModel> verificarAutorizacion(String userId) async {
    try {
      final docRef = _firestore.collection('users').doc(userId);
      final doc = await docRef.get();

      if (!doc.exists) {
        throw Exception('Usuario no encontrado');
      }

      final userData = doc.data() as Map<String, dynamic>;
      final userModel = UserModel.fromJson(userData);

      // Como todos son estudiantes, simplemente verificamos que el usuario exista
      // y devolvemos su modelo completo
      return userModel;
    } catch (e) {
      throw Exception('Error al verificar autorización: ${e.toString()}');
    }
  }

  // Método para verificar la sesión actual de manera segura
  Future<UserModel?> getCurrentUser() async {
    try {
      final User? currentUser = _firebaseAuth.currentUser;

      if (currentUser == null) {
        return null;
      }

      return await verificarAutorizacion(currentUser.uid);
    } catch (e) {
      // Si hay un error, es mejor devolver null para indicar que no hay un usuario autenticado
      return null;
    }
  }
}
