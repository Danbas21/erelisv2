import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NavigationInitial extends NavigationState {}

class NavigationToSection extends NavigationState {
  final String sectionKey;

  NavigationToSection({required this.sectionKey});

  @override
  List<Object?> get props => [sectionKey];
}

class NavigationToPage extends NavigationState {
  final String route;
  final Object? arguments;

  NavigationToPage({required this.route, this.arguments});

  @override
  List<Object?> get props => [route, arguments];
}
