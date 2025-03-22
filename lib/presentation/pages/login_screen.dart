// lib/screens/login_screen.dart
import 'package:erelis/config/app_colors.dart';
import 'package:erelis/config/routes.dart';
import 'package:erelis/core/utils/validators.dart';
import 'package:erelis/presentation/widgets/common/custom_text_field.dart';
import 'package:erelis/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDarkBlue,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            // Navegar al dashboard cuando el usuario está autenticado y autorizado
            NavigationService().navigateTo(AppRoutes.salon);
          } else if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 60),
                  // Logo y título
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Plataforma Educativa Erelis',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  // Formulario
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Campos de entrada
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Correo electrónico',
                          prefixIcon: Icons.email,
                          validator: Validators.validateEmail,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Contraseña',
                          prefixIcon: Icons.lock,
                          isPassword: true,
                          validator: Validators.validatePassword,
                        ),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Navegar a la página de recuperación de contraseña
                            },
                            child: TextButton(
                              onPressed: () => _forgotPassword(context),
                              child: const Text('¿Olvidaste tu contraseña?'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Botón de inicio de sesión
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: state is Loading
                                ? null
                                : () {
                                    // Validar campos antes de iniciar sesión
                                    if (Validators.validateEmail(
                                                _emailController.text) ==
                                            null &&
                                        Validators.validatePassword(
                                                _passwordController.text) ==
                                            null) {
                                      context
                                          .read<AuthBloc>()
                                          .add(AuthEvent.signIn(
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                          ));
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryOrange,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: state is Loading
                                ? CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  )
                                : Text(
                                    'Iniciar Sesión',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Separador
                        Row(
                          children: [
                            Expanded(
                              child: Divider(color: AppColors.divider),
                            ),
                            Expanded(
                              child: Divider(color: AppColors.divider),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Botón de Google
                        // SizedBox(
                        //   width: double.infinity,
                        //   child: OutlinedButton.icon(
                        //     onPressed: state is Loading
                        //         ? null
                        //         : () {
                        //             context
                        //                 .read<AuthBloc>()
                        //                 .add(GoogleLoginEvent());
                        //           },
                        //     icon: Image.asset(
                        //       'assets/images/google_logo.png',
                        //       height: 24,
                        //     ),
                        //     label: Text(
                        //       'Continuar con Google',
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 16,
                        //       ),
                        //     ),
                        //     style: OutlinedButton.styleFrom(
                        //       side: BorderSide(color: AppColors.divider),
                        //       padding: const EdgeInsets.symmetric(vertical: 16),
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(8),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Enlace para registrarse
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿No tienes una cuenta?',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navegar a la páginasetState(() {

                          NavigationService().navigateTo(AppRoutes.register);
                        },
                        child: Text(
                          'Regístrate',
                          style: TextStyle(
                            color: AppColors.primaryLightBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _forgotPassword(BuildContext context) {
    final resetEmailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Restablecer Contraseña'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Ingresa tu correo electrónico y te enviaremos instrucciones para restablecer tu contraseña.',
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: resetEmailController, // Usar un nuevo controlador
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCELAR'),
          ),
          ElevatedButton(
            onPressed: () {
              if (resetEmailController.text.isNotEmpty) {
                context.read<AuthBloc>().add(
                      AuthEvent.resetPassword(
                        email: resetEmailController.text.trim(),
                      ),
                    );
                Navigator.pop(context);
              }
            },
            child: const Text('ENVIAR'),
          ),
        ],
      ),
    );
  }
}
