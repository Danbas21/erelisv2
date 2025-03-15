import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  factory UserModel({
    required String id,
    required String user,
    required String nombre,
    required String apellido,
    required String correo,
    required String telefono,
    required String curp,
    required String escuela,
    required String grado,
    String? fotoUrl,
    @Default('estudiante') String rol,
    @Default({}) Map<String, bool> permisos,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
