import 'dart:core';

import 'package:erelis/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  @override
  Future<bool> isAuthenticated() async {
    try {
      return false;
    } catch (e) {
      throw Exception('Error al verificar autenticación: $e');
    }
  }

  @override
  Future<String> getCurrentUserId() async {
    try {
      return 'mock-user-id';
    } catch (e) {
      throw Exception('Error al obtener ID de usuario: $e');
    }
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await Future.delayed(Duration(seconds: 1));
    } catch (e) {
      throw Exception('Error al iniciar sesión: $e');
    }
  }

  @override
  Future<void> signUp(String email, String password, String name) async {
    try {
      await Future.delayed(Duration(seconds: 1));
    } catch (e) {
      throw Exception('Error al registrar usuario: $e');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await Future.delayed(Duration(milliseconds: 500));
    } catch (e) {
      throw Exception('Error al cerrar sesión: $e');
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await Future.delayed(Duration(seconds: 1));
    } catch (e) {
      throw Exception('Error al restablecer contraseña: $e');
    }
  }
}
