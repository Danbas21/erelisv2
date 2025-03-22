// lib/config/routes.dart
import 'package:erelis/features/questions/domain/models/question.dart';
import 'package:erelis/features/questions/presentation/pages/test_intro_page.dart';
import 'package:erelis/features/questions/presentation/pages/test_page.dart';
import 'package:erelis/features/questions/presentation/pages/test_results_detail_page.dart';
import 'package:erelis/features/salon/presentation/pages/salon_screen.dart';

import 'package:erelis/features/unidad/presentation/pages/units_page.dart';
import 'package:erelis/presentation/pages/diagnostic.dart';
import 'package:erelis/presentation/pages/landing_page.dart';
import 'package:erelis/presentation/pages/login_screen.dart';
import 'package:erelis/presentation/pages/registration_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String landing = '/initial';
  static const String login = '/login';
  static const String register = '/register';
  static const String diagnostic = '/diagnostic';
  static const String dashboard = '/dashboard';
  static const String courses = '/courses';
  static const String courseDetail = '/course-detail';
  static const String salon = '/salon';
  static const String units = '/units';
  static const String courseUnits = '/course-units';
  static const String unitContent = '/unidad';
  static const String testIntro = '/courses/:courseId/units/:unitId/test';
  static const String test = '/courses/:courseId/units/:unitId/test/start';
  static const String testResults =
      '/courses/:courseId/units/:unitId/test/results';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landing:
        return MaterialPageRoute(builder: (_) => LandingPage());
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case register:
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      case diagnostic:
        return MaterialPageRoute(builder: (_) => DiagnosticDashboardScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => SalonScreen());
      case salon:
        return MaterialPageRoute(builder: (_) => const SalonScreen());
      case units:
        Map<String, dynamic> args = {};

        // Verificar si hay argumentos y extraerlos de manera segura
        if (settings.arguments != null) {
          args = settings.arguments as Map<String, dynamic>;
        }

        // Extraer el courseId de los argumentos, con un valor predeterminado vacío
        final String courseId = args['courseId'] as String? ?? '';
        final String courseName = args['title'] as String? ?? '';

        return MaterialPageRoute(
          builder: (_) => UnitsPage(courseId: courseId, courseName: courseName),
        );
      case testIntro:
        final args = settings.arguments as Map<String, dynamic>?;
        final courseId = args?['courseId'] as String? ?? '';
        final unitId = args?['unitId'] as String? ?? '';
        final title = args?['title'] as String? ?? 'Examen';
        final questionCount = args?['questionCount'] as int? ?? 0;

        return MaterialPageRoute(
          builder: (context) => TestIntroPage(
            courseId: courseId,
            unitId: unitId,
            title: title,
            questionCount: questionCount,
          ),
        );

      case test:
        final args = settings.arguments as Map<String, dynamic>?;
        final courseId = args?['courseId'] as String? ?? '';
        final unitId = args?['unitId'] as String? ?? '';
        final title = args?['title'] as String? ?? 'Examen';

        return MaterialPageRoute(
          builder: (context) => TestPage(
            courseId: courseId,
            unitId: unitId,
            title: title,
          ),
        );

      case testResults:
        final args = settings.arguments as Map<String, dynamic>?;
        final questions = args?['questions'] as List<Question>? ?? [];
        final result = args?['result'] as TestResult? ??
            TestResult(
              testId: '',
              answers: [],
              totalPoints: 0,
              earnedPoints: 0,
              percentage: 0,
              isCompleted: false,
            );

        return MaterialPageRoute(
          builder: (context) => TestResultsDetailPage(
            questions: questions,
            result: result,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Ruta no definida: ${settings.name}'),
            ),
          ),
        );
    }
  }
}
