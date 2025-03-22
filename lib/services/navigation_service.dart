import 'package:flutter/material.dart';

class NavigationService {
  // Patrón singleton
  static final NavigationService _instance = NavigationService._internal();

  factory NavigationService() => _instance;

  NavigationService._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToReplace(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToAndRemoveUntil(String routeName,
      {Object? arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }
}

// Instancia global para uso en toda la aplicación
final navigationService = NavigationService();

extension NavigationServiceExtension on NavigationService {
  // Navegar con transición personalizada
  Future<dynamic> navigateWithAnimation(
    String routeName, {
    Object? arguments,
    bool isReplacement = false,
    bool clearStack = false,
    Duration duration = const Duration(milliseconds: 300),
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transitionBuilder,
  }) {
    final route = PageRouteBuilder(
      settings: RouteSettings(name: routeName, arguments: arguments),
      pageBuilder: (context, animation, secondaryAnimation) {
        return navigatorKey
            .currentState!
            .widget
            .onGenerateRoute!(
          RouteSettings(name: routeName, arguments: arguments),
        )
            ?.settings
            .builder!(context);
      },
      transitionDuration: duration,
      transitionsBuilder: transitionBuilder ??
          (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
    );

    if (clearStack) {
      return navigatorKey.currentState!.pushAndRemoveUntil(
        route,
        (route) => false,
      );
    } else if (isReplacement) {
      return navigatorKey.currentState!.pushReplacement(route);
    } else {
      return navigatorKey.currentState!.push(route);
    }
  }

  // Retroceder a una ruta específica
  void popUntilNamed(String routeName) {
    navigatorKey.currentState!.popUntil(
      (route) => route.settings.name == routeName,
    );
  }
}

extension on RouteSettings {
  get builder => null;
}
