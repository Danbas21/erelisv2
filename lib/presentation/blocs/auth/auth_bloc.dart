// auth_bloc.dart
import 'dart:async';
import 'dart:io';
import 'package:auth_models/auth_models.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

/// Bloc para manejar la lógica de autenticación
///
/// Se encarga de gestionar todos los estados relacionados con la autenticación
/// y la comunicación con el servicio de autenticación.
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  StreamSubscription? _authSubscription;

  AuthBloc({required AuthService authService})
      : _authService = authService,
        super(const AuthState.initial()) {
    // Registrar manejadores de eventos
    on<_CheckAuthStatus>(_onCheckAuthStatus);
    on<_SignIn>(_onSignIn);
    on<_SignUp>(_onSignUp);
    on<_SignOut>(_onSignOut);
    on<_UpdateProfile>(_onUpdateProfile);
    on<_ResetPassword>(_onResetPassword);
    on<_AuthError>(_onAuthError);
    on<_Loading>(_onLoading);
    on<_Authenticated>(_onAuthenticated);
    on<_Unauthenticated>(_onUnauthenticated);

    // Configurar escucha de cambios de autenticación
    _setupAuthListener();
  }

  /// Maneja el evento de carga
  FutureOr<void> _onLoading(_Loading event, Emitter<AuthState> emit) {
    emit(const AuthState.loading());
  }

  /// Maneja el evento de autenticación exitosa
  FutureOr<void> _onAuthenticated(
    _Authenticated event,
    Emitter<AuthState> emit,
  ) {
    emit(AuthState.authenticated(user: event.user, token: event.token));
  }

  /// Maneja el evento de usuario no autenticado
  FutureOr<void> _onUnauthenticated(
    _Unauthenticated event,
    Emitter<AuthState> emit,
  ) {
    emit(const AuthState.unauthenticated());
  }

  /// Configura el listener para los cambios de estado de autenticación
  void _setupAuthListener() {
    _authSubscription = _authService.authStateChanges.listen((
      AuthModel authModel,
    ) {
      // Cuando cambia el estado de autenticación, convierte el modelo a un evento BLoC
      switch (authModel.status) {
        case AuthStatus.authenticated:
          if (authModel.user != null && authModel.token != null) {
            add(
              AuthEvent.authenticated(
                user: authModel.user!,
                token: authModel.token!,
              ),
            );
          }
          break;
        case AuthStatus.unauthenticated:
          add(const AuthEvent.unauthenticated());
          break;
        case AuthStatus.error:
          if (authModel.errorMessage != null) {
            add(AuthEvent.authError(message: authModel.errorMessage!));
          }
          break;
        case AuthStatus.loading:
          add(const AuthEvent.loading());
          break;
        default:
          break;
      }
    });
  }

  /// Verifica el estado actual de autenticación
  FutureOr<void> _onCheckAuthStatus(
    _CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final authModel = await _authService.checkAuthStatus();

      if (authModel.isAuthenticated && authModel.user != null) {
        emit(
          AuthState.authenticated(
            user: authModel.user!,
            token: authModel.token!,
          ),
        );
      } else if (authModel.status == AuthStatus.error &&
          authModel.errorMessage != null) {
        emit(AuthState.error(message: authModel.errorMessage!));
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }

  /// Maneja el inicio de sesión
  FutureOr<void> _onSignIn(_SignIn event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      final authModel = await _authService.signIn(
        event.email,
        event.password,
      );

      if (authModel.isAuthenticated && authModel.user != null) {
        emit(
          AuthState.authenticated(
            user: authModel.user!,
            token: authModel.token!,
          ),
        );
      } else if (authModel.status == AuthStatus.error &&
          authModel.errorMessage != null) {
        emit(AuthState.error(message: authModel.errorMessage!));
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }

  /// Maneja el registro de nuevo usuario
  FutureOr<void> _onSignUp(_SignUp event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      // Convertir String de foto a File si se proporciona
      File? fotoFile;
      if (event.foto != null) {
        fotoFile = File(event.foto as String);
      }

      final authModel = await _authService.signUp(
        email: event.email,
        password: event.password,
        nombre: event.nombre,
        apellido: event.apellido,
        telefono: event.telefono,
        curp: event.curp,
        escuela: event.escuela,
        grado: event.grado,
        displayName: event.displayName,
        foto: fotoFile,
      );

      if (authModel.isAuthenticated && authModel.user != null) {
        emit(
          AuthState.authenticated(
            user: authModel.user!,
            token: authModel.token!,
          ),
        );
      } else if (authModel.status == AuthStatus.error &&
          authModel.errorMessage != null) {
        emit(AuthState.error(message: authModel.errorMessage!));
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }

  /// Maneja el cierre de sesión
  FutureOr<void> _onSignOut(_SignOut event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      await _authService.signOut();
      emit(const AuthState.unauthenticated());
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }

  /// Maneja la actualización del perfil de usuario
  FutureOr<void> _onUpdateProfile(
    _UpdateProfile event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final success = await _authService.updateUserProfile(event.user);

      if (success) {
        // Usar pattern matching con switch expression
        switch (state) {
          case Authenticated(:final token):
            // Si está autenticado, mantener el token pero actualizar el usuario
            emit(AuthState.authenticated(user: event.user, token: token));
            break;
          default:
            // Si no está en estado autenticado, no se puede actualizar el perfil
            emit(
              const AuthState.error(
                message:
                    'No se pudo actualizar el perfil: el usuario no está autenticado',
              ),
            );
        }
      } else {
        emit(const AuthState.error(message: 'No se pudo actualizar el perfil'));
      }
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }

  /// Maneja el restablecimiento de contraseña
  FutureOr<void> _onResetPassword(
    _ResetPassword event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final success = await _authService.sendPasswordResetEmail(event.email);

      if (success) {
        emit(const AuthState.passwordResetSent());
      } else {
        emit(
          const AuthState.error(
            message: 'No se pudo enviar el correo de restablecimiento',
          ),
        );
      }
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }

  /// Maneja errores de autenticación
  FutureOr<void> _onAuthError(_AuthError event, Emitter<AuthState> emit) {
    emit(AuthState.error(message: event.message));
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
