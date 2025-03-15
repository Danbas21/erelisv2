import 'package:erelis/features/tablero/domain/entities/user_profile_entity.dart';
import 'package:erelis/features/tablero/domain/repositories/tablero_repository.dart';

class GetUserProfileUseCase {
  final TableroRepository repository;

  GetUserProfileUseCase(this.repository);

  Future<UserProfileEntity> call() async {
    return await repository.getUserProfile();
  }
}
