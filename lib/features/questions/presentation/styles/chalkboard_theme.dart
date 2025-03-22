// lib/features/test/presentation/styles/chalkboard_theme.dart
import 'package:flutter/material.dart';

class ChalkboardTheme {
  static TextStyle get chalkTextStyle => const TextStyle(
        fontFamily: 'Chalk', // Necesitarás añadir esta fuente a tu pubspec.yaml
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.white30,
            blurRadius: 2.0,
            offset: Offset(0.5, 0.5),
          ),
        ],
      );

  static TextStyle get chalkTitleStyle => chalkTextStyle.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      );

  static TextStyle get chalkSubtitleStyle => chalkTextStyle.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.8,
      );

  static BoxDecoration get chalkboardDecoration => BoxDecoration(
        color: const Color(0xFF1A5B1A), // Verde oscuro para el pizarrón
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF8D6E63), // Café para el marco
          width: 8,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      );

  static BoxDecoration get optionDecoration => BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white30,
          width: 2,
        ),
      );

  static BoxDecoration get selectedOptionDecoration =>
      optionDecoration.copyWith(
        color: Colors.white.withOpacity(0.3),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      );
}
