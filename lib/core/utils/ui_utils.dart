// lib/core/utils/ui_utils.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UIUtils {
  // Formato para fechas
  static String formatDate(DateTime date, {String format = 'dd/MM/yyyy'}) {
    return DateFormat(format).format(date);
  }

  // Mostrar snackbar
  static void showSnackBar(BuildContext context, String message,
      {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // Mostrar diálogo de confirmación
  static Future<bool> showConfirmDialog(
    BuildContext context, {
    required String title,
    required String message,
    String confirmText = 'Confirmar',
    String cancelText = 'Cancelar',
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(cancelText),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(confirmText),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  // Calcular el color de contraste basado en un color base
  static Color getContrastColor(Color backgroundColor) {
    // Fórmula para determinar si un color es claro u oscuro
    final luminance = (0.299 * backgroundColor.red +
            0.587 * backgroundColor.green +
            0.114 * backgroundColor.blue) /
        255;
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  // Obtener tamaño de pantalla responsive
  static double getResponsiveWidth(BuildContext context,
      {double percentage = 1.0}) {
    return MediaQuery.of(context).size.width * percentage;
  }

  static double getResponsiveHeight(BuildContext context,
      {double percentage = 1.0}) {
    return MediaQuery.of(context).size.height * percentage;
  }

  // Verificar si el dispositivo está en modo landscape
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  // Verificar si el dispositivo es tablet
  static bool isTablet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final diagonal =
        (size.width * size.width + size.height * size.height) * 0.5;
    return diagonal > 1100; // Aproximadamente 10 pulgadas de diagonal
  }
}
