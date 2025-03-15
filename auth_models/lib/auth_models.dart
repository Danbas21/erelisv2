import 'src/repositories/auth_repository.dart';
import 'src/repositories/firebase_auth_repository.dart';
import 'src/services/auth_service.dart';

// Exportando modelos
export 'src/models/user_model.dart';
export 'src/models/auth_model.dart';

// Exportando repositorios
export 'src/repositories/auth_repository.dart';
export 'src/repositories/firebase_auth_repository.dart';

// Exportando servicios
export 'src/services/auth_service.dart';

// Clase principal para inicializar el paquete
class MiAuthPackage {
  static final MiAuthPackage _instance = MiAuthPackage._internal();

  factory MiAuthPackage() => _instance;

  MiAuthPackage._internal();

  // Inicializa el paquete
  Future<void> initialize() async {
    // Aquí puedes realizar inicializaciones necesarias
    print('Inicializando paquete de autenticación...');
  }

  // Proporciona un repositorio de autenticación configurado
  AuthRepository provideAuthRepository() {
    return FirebaseAuthRepository();
  }

  // Proporciona un servicio de autenticación configurado
  AuthService provideAuthService() {
    return AuthService(provideAuthRepository());
  }
}
