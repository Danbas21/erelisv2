import 'package:flutter/material.dart';

class ResponsiveUtils {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 900;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 900;

  // Obtener ancho responsive basado en porcentajes
  static double getWidthPercentage(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * (percentage / 100);
  }

  // Obtener altura responsive basada en porcentajes
  static double getHeightPercentage(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * (percentage / 100);
  }

  // Calcular tamaño de fuente responsive con límites mínimos y máximos
  static double getResponsiveFontSize(
    BuildContext context, {
    required double baseFontSize,
    double? minFontSize,
    double? maxFontSize,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Tomar la dimensión más pequeña para determinar la escala
    double smallerDimension =
        screenWidth < screenHeight ? screenWidth : screenHeight;

    // Escalar el tamaño de la fuente
    // (factor de 720 es un tamaño de referencia para un dispositivo típico)
    double scaleFactor = smallerDimension / 720;
    double responsiveFontSize = baseFontSize * scaleFactor;

    // Aplicar límites si están definidos
    if (minFontSize != null && responsiveFontSize < minFontSize) {
      return minFontSize;
    }

    if (maxFontSize != null && responsiveFontSize > maxFontSize) {
      return maxFontSize;
    }

    return responsiveFontSize;
  }

  // Calcular padding responsive basado en el tamaño de la pantalla
  static EdgeInsets getResponsivePadding(BuildContext context) {
    if (isMobile(context)) {
      return EdgeInsets.symmetric(horizontal: 20, vertical: 30);
    } else if (isTablet(context)) {
      return EdgeInsets.symmetric(horizontal: 40, vertical: 40);
    } else {
      return EdgeInsets.symmetric(horizontal: 60, vertical: 50);
    }
  }

  // Obtener número de columnas para una grid basada en el ancho de la pantalla
  static int getResponsiveGridColumnCount(BuildContext context) {
    if (isMobile(context)) {
      return 1;
    } else if (isTablet(context)) {
      return 2;
    } else {
      // Ajustar el número de columnas basado en rangos de ancho
      double width = MediaQuery.of(context).size.width;
      if (width < 1200) {
        return 3;
      } else if (width < 1600) {
        return 4;
      } else {
        return 5;
      }
    }
  }
}
