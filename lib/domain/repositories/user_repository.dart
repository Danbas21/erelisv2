import '../entities/user_entity.dart';

abstract class UserRepository {
  /// Obtiene los datos del usuario actualmente autenticado
  Future<UserEntity?> getCurrentUser();

  /// Actualiza la información del perfil del usuario
  Future<void> updateUserProfile(UserEntity user);

  /// Obtiene un usuario por su ID
  Future<UserEntity?> getUserById(String userId);

  /// Cierra la sesión del usuario actual
  Future<void> signOut();
}
