// import 'package:erelis/features/unidades/presentation/pages/unit_detail_page.dart';
// import 'package:flutter/material.dart';

// /// Una transición personalizada que combina fade y scale para un efecto elegante
// class FadeScaleTransition extends StatelessWidget {
//   final Widget child;
//   final Animation<double> animation;

//   const FadeScaleTransition({
//     super.key,
//     required this.child,
//     required this.animation,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: animation,
//       builder: (context, child) {
//         final scaleValue = Curves.easeOutCubic.transform(
//             animation.value < 0.5 ? 0.0 : (animation.value - 0.5) * 2);

//         final fadeValue = Curves.easeInOut
//             .transform(animation.value < 0.3 ? animation.value / 0.3 : 1.0);

//         return Opacity(
//           opacity: fadeValue,
//           child: Transform.scale(
//             scale: 0.8 + (scaleValue * 0.2),
//             child: child,
//           ),
//         );
//       },
//       child: child,
//     );
//   }
// }

// /// Una ruta de página que usa la transición FadeScale
// class FadeScalePageRoute<T> extends PageRoute<T> {
//   final Widget page;
//   @override
//   final RouteSettings settings;

//   FadeScalePageRoute({
//     required this.page,
//     required this.settings,
//   }) : super(settings: settings);

//   @override
//   Color? get barrierColor => null;

//   @override
//   String? get barrierLabel => null;

//   @override
//   bool get maintainState => true;

//   @override
//   Duration get transitionDuration => const Duration(milliseconds: 300);

//   @override
//   Widget buildPage(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation) {
//     return FadeScaleTransition(
//       animation: animation,
//       child: page,
//     );
//   }
// }

// // routes.dart (ejemplo de uso de la transición personalizada)
// Route<dynamic> generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case '/unit_detail':
//       final args = settings.arguments as Map<String, dynamic>;
//       return FadeScalePageRoute(
//         settings: settings,
//         page: UnitDetailPage(unitId: args['unitId']),
//       );
//     default:
//       return MaterialPageRoute(
//         builder: (_) => const Scaffold(
//           body: Center(
//             child: Text('Ruta no encontrada'),
//           ),
//         ),
//       );
//   }
// }
