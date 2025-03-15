class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu correo electrónico';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Ingresa un correo electrónico válido';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu contraseña';
    }
    if (value.length < 5) {
      return 'La contraseña debe tener al menos 5 caracteres';
    }

    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
    bool hasDigit = value.contains(RegExp(r'[0-9]'));
    bool hasSpecialChar = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!hasUppercase || !hasDigit || !hasSpecialChar) {
      return 'La contraseña debe incluir al menos una mayúscula, un número y un carácter especial';
    }

    return null;
  }

  static String? validateConfirmPassword(
      String password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Por favor confirma tu contraseña';
    }
    if (password != confirmPassword) {
      return 'Las contraseñas no coinciden';
    }
    return null;
  }

  static String? validateRequiredField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu $fieldName';
    }
    return null;
  }

  static String? validateCURP(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu CURP';
    }
    // Patrón básico de CURP mexicana
    final curpRegExp = RegExp(r'^[A-Z]{4}[0-9]{6}[A-Z]{6}[0-9A-Z]{2}$');
    if (!curpRegExp.hasMatch(value)) {
      return 'Ingresa un CURP válido';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu número telefónico';
    }
    // Validar que solo contenga números y tenga 10 dígitos (México)
    final phoneRegExp = RegExp(r'^[0-9]{10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Ingresa un número telefónico válido de 10 dígitos';
    }
    return null;
  }
}
