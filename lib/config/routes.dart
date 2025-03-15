import 'package:erelis/data/datasources/firebase/import_tool_screen.dart';
import 'package:erelis/features/salon/presentation/pages/salon_screen.dart';
import 'package:erelis/presentation/pages/dashboard_screen.dart';
import 'package:erelis/presentation/pages/diagnostic.dart';
import 'package:erelis/presentation/pages/login_screen.dart';
import 'package:erelis/presentation/pages/registration_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String landing = '/initial';
  static const String login = '/login';
  static const String register = '/register';
  static const String diagnostic = '/diagnostic'; // Nueva ruta
  static const String dashboard = '/dashboard';
  static const String courses = '/courses';
  static const String courseDetail = '/course-detail';
  static const String salon = '/salon';

  static Map<String, WidgetBuilder> get routes => {
        landing: (context) => GoogleImporter(),
        login: (context) => LoginPage(),
        register: (context) => RegistrationScreen(),
        diagnostic: (context) => DiagnosticDashboardScreen(), // Nuevo dashboard
        dashboard: (context) => DashboardScreen(),
        salon: (context) => const SalonScreen(),
        // Otras rutas
      };
}
