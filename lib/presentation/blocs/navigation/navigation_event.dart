import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NavigateToSection extends NavigationEvent {
  final String sectionKey;

  NavigateToSection({required this.sectionKey});

  @override
  List<Object?> get props => [sectionKey];
}

class NavigateToPage extends NavigationEvent {
  final String route;
  final Object? arguments;

  NavigateToPage({required this.route, this.arguments});

  @override
  List<Object?> get props => [route, arguments];
}
