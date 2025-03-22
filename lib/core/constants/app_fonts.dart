import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  // Fuente estilo "hecha a mano" para el contenido de la unidad
  static TextStyle get handwriting => GoogleFonts.kalam(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        height: 1.6,
        color: Colors.black87,
      );

  static TextStyle get handwritingBold => GoogleFonts.kalam(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        height: 1.6,
        color: Colors.black87,
      );

  static TextStyle get handwritingTitle => GoogleFonts.kalam(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        height: 1.3,
        color: Colors.black87,
      );
}
