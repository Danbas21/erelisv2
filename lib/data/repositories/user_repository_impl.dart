import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<UserEntity?> getCurrentUser() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) return null;

      final userDoc =
          await _firestore.collection('users').doc(currentUser.uid).get();

      if (!userDoc.exists) return null;

      return UserEntity.fromJson(userDoc.data() as Map<String, dynamic>);
    } catch (e) {
      print('Error al obtener usuario: $e');
      return null;
    }
  }

  @override
  Future<void> updateUserProfile(UserEntity user) async {
    try {
      await _firestore.collection('users').doc(user.id).update(user.toJson());
    } catch (e) {
      print('Error al actualizar usuario: $e');
      rethrow;
    }
  }

  @override
  Future<UserEntity?> getUserById(String userId) async {
    try {
      final userDoc = await _firestore.collection('users').doc(userId).get();

      if (!userDoc.exists) return null;

      return UserEntity.fromJson(userDoc.data() as Map<String, dynamic>);
    } catch (e) {
      print('Error al obtener usuario por ID: $e');
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error al cerrar sesión: $e');
      rethrow;
    }
  }
}
