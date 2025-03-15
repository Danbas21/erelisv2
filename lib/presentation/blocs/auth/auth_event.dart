part of 'auth_bloc.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  /// Verificar estado de autenticación
  const factory AuthEvent.checkAuthStatus() = _CheckAuthStatus;

  /// Iniciar sesión
  const factory AuthEvent.signIn({
    required String email,
    required String password,
  }) = _SignIn;

  /// Registrar nuevo usuario
  const factory AuthEvent.signUp({
    required String email,
    required String password,
    String? displayName,
    required String nombre,
    required String apellido,
    required String telefono,
    required String curp,
    required String escuela,
    required String grado,
    String? foto,
  }) = _SignUp;

  /// Cerrar sesión
  const factory AuthEvent.signOut() = _SignOut;

  /// Actualizar perfil
  const factory AuthEvent.updateProfile({
    required UserModel user,
  }) = _UpdateProfile;

  /// Restablecer contraseña
  const factory AuthEvent.resetPassword({
    required String email,
  }) = _ResetPassword;

  /// Error de autenticación
  const factory AuthEvent.authError({
    required String message,
  }) = _AuthError;

  /// Evento de carga
  const factory AuthEvent.loading() = _Loading;

  /// Estado de autenticación recibido directamente
  const factory AuthEvent.authenticated({
    required UserModel user,
    required String token,
  }) = _Authenticated;

  /// Evento de usuario no autenticado
  const factory AuthEvent.unauthenticated() = _Unauthenticated;
}
