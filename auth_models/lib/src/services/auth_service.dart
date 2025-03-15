import 'dart:async';
import 'dart:io';
import '../../auth_models.dart';

class AuthService {
  final AuthRepository _repository;

  // Constructor con inyección de dependencias
  AuthService([AuthRepository? repository])
    : _repository = repository ?? FirebaseAuthRepository();
  // Métodos de autenticación con mejor manejo de errores
  Future<AuthModel> signIn(String email, String password) async {
    try {
      // Validaciones básicas
      if (email.isEmpty) {
        return AuthModel.error('El email no puede estar vacío');
      }
      if (password.isEmpty) {
        return AuthModel.error('La contraseña no puede estar vacía');
      }

      _repository.notifyLoadingState();
      return await _repository.signIn(email: email, password: password);
    } catch (e) {
      return AuthModel.error('Error en inicio de sesión: ${e.toString()}');
    }
  }

  Future<AuthModel> signUp({
    required String email,
    required String password,
    required String nombre,
    required String apellido,
    required String telefono,
    required String curp,
    required String escuela,
    required String grado,
    String? displayName,
    File? foto,
  }) async {
    try {
      _repository.notifyLoadingState();

      return await _repository.signUp(
        email: email,
        password: password,
        displayName: displayName,
        nombre: nombre,
        apellido: apellido,
        telefono: telefono,
        curp: curp,
        escuela: escuela,
        grado: grado,
        foto: foto,
      );
    } catch (e) {
      return AuthModel.error('Error en registro: ${e.toString()}');
    }
  }

  Future<bool> signOut() async {
    try {
      _repository.notifyLoadingState();
      await _repository.signOut();
      return true;
    } catch (e) {
      print('Error en cierre de sesión: $e');
      return false;
    }
  }

  Future<AuthModel> checkAuthStatus() async {
    try {
      return await _repository.getCurrentAuth();
    } catch (e) {
      return AuthModel.error(
        'Error verificando estado de autenticación: ${e.toString()}',
      );
    }
  }

  Future<bool> updateUserProfile(UserModel updatedUser) async {
    try {
      _repository.notifyLoadingState();
      return await _repository.updateUser(updatedUser);
    } catch (e) {
      print('Error actualizando perfil: $e');
      return false;
    }
  }

  Future<bool> sendPasswordResetEmail(String email) async {
    try {
      _repository.notifyLoadingState();
      return await _repository.resetPassword(email);
    } catch (e) {
      print('Error enviando correo de restablecimiento: $e');
      return false;
    }
  }

  // Stream para observar cambios en el estado de autenticación

  // Método para liberar recursos

  Stream<AuthModel> get authStateChanges => _repository.authStateChanges;
}
