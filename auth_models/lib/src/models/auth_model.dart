// Archivo: lib/src/models/auth_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';
part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
sealed class AuthModel with _$AuthModel {
  const factory AuthModel({
    UserModel? user,
    String? token,
    @Default(AuthStatus.unauthenticated) AuthStatus status,
    String? errorMessage,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  // Constructor para estado inicial
  factory AuthModel.initial() => const AuthModel(status: AuthStatus.initial);

  // Constructor para estado autenticado
  factory AuthModel.authenticated(UserModel user, String token) =>
      AuthModel(user: user, token: token, status: AuthStatus.authenticated);

  // Constructor para estado de error
  factory AuthModel.error(String message) =>
      AuthModel(status: AuthStatus.error, errorMessage: message);

  // Métodos adicionales
  const AuthModel._();

  bool get isAuthenticated =>
      status == AuthStatus.authenticated && user != null && token != null;
  bool get isLoading => status == AuthStatus.loading;
}

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }
