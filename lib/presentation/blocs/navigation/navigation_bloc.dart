import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erelis/presentation/blocs/navigation/navigation_event.dart';
import 'package:erelis/presentation/blocs/navigation/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigateToSection>(_onNavigateToSection);
    on<NavigateToPage>(_onNavigateToPage);
  }

  void _onNavigateToSection(
    NavigateToSection event,
    Emitter<NavigationState> emit,
  ) {
    emit(NavigationToSection(sectionKey: event.sectionKey));
  }

  void _onNavigateToPage(NavigateToPage event, Emitter<NavigationState> emit) {
    emit(NavigationToPage(route: event.route, arguments: event.arguments));
  }
}
