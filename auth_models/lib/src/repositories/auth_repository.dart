import 'dart:async';
import 'dart:io';
import '../models/auth_model.dart';
import '../models/user_model.dart';

abstract class AuthRepository {
  Stream<AuthModel> get authStateChanges;
  void notifyLoadingState();

  Future<AuthModel> signIn({required String email, required String password});

  Future<AuthModel> signUp({
    required String email,
    required String password,
    String? displayName,
    required String nombre,
    required String apellido,
    required String telefono,
    required String curp,
    required String escuela,
    required String grado,
    File? foto,
  });

  Future<void> signOut();
  Future<AuthModel> getCurrentAuth();
  Future<UserModel?> getCurrentUser();
  Future<bool> updateUser(UserModel user);
  Future<bool> resetPassword(String email);
  void dispose();
}
