// lib/screens/auth_wrapper.dart
import 'package:erelis/features/salon/presentation/pages/salon_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth/auth_bloc.dart';

import 'login_screen.dart';
import 'landing_page.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Verificar el estado de autenticación al iniciar
    context.read<AuthBloc>().add(AuthEvent.checkAuthStatus());

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          // Mostrar mensaje de error si no está autorizado
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.token),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Loading) {
            return const LandingPage();
          } else if (state is Authenticated) {
            return const SalonScreen();
          } else if (state is Authenticated) {
            // El usuario está autenticado pero aún verificando autorización
            return LoginPage();
          } else {
            // Unauthenticated o cualquier otro estado no manejado
            return const LandingPage();
          }
        },
      ),
    );
  }
}
