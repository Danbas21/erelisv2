import 'dart:io';
import 'package:erelis/core/utils/images_utils.dart';
import 'package:erelis/presentation/blocs/auth/auth_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/utils/validators.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();

  // Controladores para los campos de texto
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _curpController = TextEditingController();
  final _escuelaController = TextEditingController();
  final _gradoController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  File? _profileImage;

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _emailController.dispose();
    _telefonoController.dispose();
    _curpController.dispose();
    _escuelaController.dispose();
    _gradoController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _profileImage = File(image.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al seleccionar imagen: $e')),
      );
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Convertir File a String path para que coincida con el evento SignUp
      final String? fotoPath = _profileImage?.path;

      // Enviar evento al AuthBloc
      context.read<AuthBloc>().add(AuthEvent.signUp(
            email: _emailController.text.trim(),
            password: _passwordController.text,
            nombre: _nombreController.text.trim(),
            apellido: _apellidoController.text.trim(),
            telefono: _telefonoController.text.trim(),
            curp: _curpController.text.trim(),
            escuela: _escuelaController.text.trim(),
            grado: _gradoController.text.trim(),
            foto: fotoPath, // Enviamos la ruta, no el objeto File
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
        backgroundColor: const Color(0xFF192A45),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // Usando pattern matching con switch para manejar estados
          switch (state) {
            case Error(:final message):
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
              break;
            case Authenticated():
              Navigator.pushReplacementNamed(context, '/diagnostic');
              break;
            default:
              // No hacer nada para otros estados
              break;
          }
        },
        builder: (context, state) {
          // Widget principal del formulario
          final Widget formContent = Container(
            decoration: const BoxDecoration(
              color: Color(0xFF192A45),
            ),
            child: Center(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Card(
                    color: const Color(0xFF455A79)
                        .withAlpha(178), // Corrigiendo el método
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Logo y título
                            _buildHeader(),
                            const SizedBox(height: 24),

                            // Foto de perfil
                            _buildProfileImagePicker(),
                            const SizedBox(height: 24),

                            // Datos personales
                            _buildPersonalDataFields(),
                            const SizedBox(height: 16),

                            // Correo electrónico
                            _buildFormField(
                              label: 'Correo electrónico',
                              controller: _emailController,
                              hintText: 'correo@ejemplo.com',
                              keyboardType: TextInputType.emailAddress,
                              validator: Validators.validateEmail,
                            ),
                            const SizedBox(height: 16),

                            // Teléfono y CURP
                            _buildPhoneAndCurpFields(),
                            const SizedBox(height: 16),

                            // Escuela y grado
                            _buildSchoolFields(),
                            const SizedBox(height: 16),

                            // Contraseña
                            _buildPasswordField(),
                            const SizedBox(height: 16),

                            // Confirmar contraseña
                            _buildConfirmPasswordField(),
                            const SizedBox(height: 24),

                            // Botón de registro
                            _buildRegisterButton(state),
                            const SizedBox(height: 16),

                            // Enlace para iniciar sesión
                            _buildLoginLink(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );

          // Mostrar overlay de carga cuando el estado es Loading
          return Stack(
            children: [
              formContent,
              if (state is Loading)
                Container(
                  color: Colors.black54,
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFFFF5722)),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  // Métodos auxiliares para construir partes del UI

  Widget _buildHeader() {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                ImagesUtils.logo,
                width: 80,
                height: 80,
              ),
              SvgPicture.asset(
                ImagesUtils.iconLogo,
                width: 80,
                height: 80,
              )
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Crea tu cuenta',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImagePicker() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey[300],
            backgroundImage:
                _profileImage != null ? FileImage(_profileImage!) : null,
            child: _profileImage == null
                ? const Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.grey,
                  )
                : null,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFF5722),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.add_a_photo,
                  color: Colors.white,
                ),
                onPressed: _pickImage,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalDataFields() {
    return Row(
      children: [
        Expanded(
          child: _buildFormField(
            label: 'Nombre',
            controller: _nombreController,
            hintText: 'Nombre',
            validator: (value) =>
                Validators.validateRequiredField(value, 'nombre'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildFormField(
            label: 'Apellido',
            controller: _apellidoController,
            hintText: 'Apellido',
            validator: (value) =>
                Validators.validateRequiredField(value, 'apellido'),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneAndCurpFields() {
    return Row(
      children: [
        Expanded(
          child: _buildFormField(
            label: 'Teléfono',
            controller: _telefonoController,
            hintText: '10 dígitos',
            keyboardType: TextInputType.phone,
            validator: Validators.validatePhone,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildFormField(
            label: 'CURP',
            controller: _curpController,
            hintText: 'CURP',
            textCapitalization: TextCapitalization.characters,
            validator: Validators.validateCURP,
          ),
        ),
      ],
    );
  }

  Widget _buildSchoolFields() {
    return Row(
      children: [
        Expanded(
          child: _buildFormField(
            label: 'Escuela',
            controller: _escuelaController,
            hintText: 'Nombre de la escuela',
            validator: (value) =>
                Validators.validateRequiredField(value, 'escuela'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildFormField(
            label: 'Grado',
            controller: _gradoController,
            hintText: 'Grado escolar',
            validator: (value) =>
                Validators.validateRequiredField(value, 'grado'),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return _buildFormField(
      label: 'Contraseña',
      controller: _passwordController,
      hintText: 'Mínimo 5 caracteres',
      obscureText: _obscurePassword,
      validator: Validators.validatePassword,
      suffixIcon: IconButton(
        icon: Icon(
          _obscurePassword ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey,
        ),
        onPressed: _togglePasswordVisibility,
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return _buildFormField(
      label: 'Confirmar contraseña',
      controller: _confirmPasswordController,
      hintText: 'Repite la contraseña',
      obscureText: _obscureConfirmPassword,
      validator: (value) => Validators.validateConfirmPassword(
        _passwordController.text,
        value,
      ),
      suffixIcon: IconButton(
        icon: Icon(
          _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey,
        ),
        onPressed: _toggleConfirmPasswordVisibility,
      ),
    );
  }

  Widget _buildRegisterButton(AuthState state) {
    return ElevatedButton(
      onPressed: state is Loading ? null : _submitForm,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF5722),
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: state is Loading
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : const Text(
              'Registrarse',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿Ya tienes cuenta?',
          style: TextStyle(
            color: Colors.white.withAlpha(178), // Corrigiendo el método
            fontSize: 14,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Inicia sesión',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // Widget auxiliar para campos de formulario
  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? suffixIcon,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            suffixIcon: suffixIcon,
          ),
          validator: validator,
        ),
      ],
    );
  }
}
