// lib/core/constants/app_constants.dart
class AppConstants {
  static const String appName = 'Erelis Platform';
  static const int unitsPerPage = 7; // Cantidad inicial de unidades a mostrar
  static const int animationDelayBase =
      100; // Milisegundos de retraso por unidad

  // Firebase collections
  static const String unitsCollection = 'units';
  static const String highlightsCollection = 'highlights';
  static const String usersCollection = 'users';
  static const String contentSubcollection = 'content';

  // Highlight colors
  static const String orangeHighlightColor = '#F59E0B';
  static const String greenHighlightColor = '#22C55E';
  static const String yellowHighlightColor = '#FFD700';
}

// lib/core/constants/route_constants.dart
class RouteConstants {
  static const String landing = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String units = '/units';
  static const String unitContent = '/unit-content';
  static const String dashboard = '/dashboard';
  static const String diagnostic = '/diagnostic';
}
