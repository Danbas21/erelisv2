// user_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    String? nombre, // Valor por defecto para evitar nulls
    String? apellido,
    String? telefono,
    String? curp,
    String? escuela,
    String? grado,
    String? displayName, // Este puede ser nulo
    String? photoUrl, // Este puede ser nulo
    String? rol,
    @Default(false) bool isEmailVerified,
    DateTime? createdAt,
    DateTime? lastLoginAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  const UserModel._();
  bool get isComplete => displayName != null && displayName!.isNotEmpty;

  UserModel copyWithUpdatedLogin() {
    return copyWith(lastLoginAt: DateTime.now());
  }
}
