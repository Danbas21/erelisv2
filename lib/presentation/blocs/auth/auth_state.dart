part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  /// Estado inicial
  const factory AuthState.initial() = Initial;

  /// Estado de carga
  const factory AuthState.loading() = Loading;

  /// Estado autenticado
  const factory AuthState.authenticated({
    required UserModel user,
    required String token,
  }) = Authenticated;

  /// Estado no autenticado
  const factory AuthState.unauthenticated() = Unauthenticated;

  /// Estado de error
  const factory AuthState.error({
    required String message,
  }) = Error;

  /// Estado de restablecimiento de contraseña
  const factory AuthState.passwordResetSent() = PasswordResetSent;
}
