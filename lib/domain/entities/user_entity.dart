import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
sealed class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String name,
    required String email,
    required String role,
    @Default('') String photoUrl,
    @Default([]) List<String> enrolledCourses,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
