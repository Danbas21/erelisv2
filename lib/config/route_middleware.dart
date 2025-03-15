import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erelis/presentation/blocs/auth/auth_bloc.dart';
import 'package:erelis/config/routes.dart';

class RouteMiddleware {
  static Widget checkAuth(Widget page) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return page;
        } else if (state is Loading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          // Redirigir a la página de login
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          });
          // Mientras tanto, mostramos un contenedor vacío
          return Container();
        }
      },
    );
  }
}
