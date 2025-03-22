// core/constants/app_text_styles.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Estilos para encabezados
  static TextStyle h1 = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle h2 = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle h3 = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Estilos para cuerpo de texto
  static TextStyle body1 = GoogleFonts.roboto(
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static TextStyle body2 = GoogleFonts.roboto(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  // Estilos para tarjetas de unidad
  static TextStyle unitTitle = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle unitSubtitle = GoogleFonts.roboto(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  // Estilos para detalle de unidad (estilo manuscrito)
  static TextStyle notebookTitle = GoogleFonts.caveat(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static TextStyle notebookContent = GoogleFonts.caveat(
    fontSize: 22,
    height: 1.5,
    color: AppColors.textPrimaryNote,
  );
}
