import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_dashboard_data_usecase.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/entities/course_entity.dart';
import '../../../domain/entities/event_entity.dart';
import '../../../domain/entities/progress_entity.dart';
import '../../../domain/entities/leaderboard_entity.dart';
import '../../../domain/entities/task_entity.dart';
import 'package:bloc/bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDashboardDataUseCase _getDashboardDataUseCase;

  DashboardBloc({
    required GetDashboardDataUseCase getDashboardDataUseCase,
  })  : _getDashboardDataUseCase = getDashboardDataUseCase,
        super(const DashboardInitialState()) {
    on<LoadDashboardEvent>(_onLoadDashboard);
    on<RefreshDashboardEvent>(_onRefreshDashboard);
    on<SelectDateEvent>(_onSelectDate);
  }

  Future<void> _onLoadDashboard(
    LoadDashboardEvent event,
    Emitter<DashboardState> emit,
  ) async {
    try {
      emit(const DashboardLoadingState());

      final dashboardData = await _getDashboardDataUseCase.execute();

      if (dashboardData.user == null) {
        emit(const DashboardErrorState(
            'No se pudo obtener la información del usuario.'));
        return;
      }

      emit(DashboardLoadedState(
        user: dashboardData.user!,
        courses: dashboardData.courses,
        events: dashboardData.events,
        progress: dashboardData.progress,
        leaderboard: dashboardData.leaderboard,
        pendingTasks: dashboardData.pendingTasks,
        selectedDate: DateTime.now(),
      ));
    } catch (e) {
      emit(DashboardErrorState('Error al cargar datos: $e'));
    }
  }

  Future<void> _onRefreshDashboard(
    RefreshDashboardEvent event,
    Emitter<DashboardState> emit,
  ) async {
    final currentState = state;
    if (currentState is DashboardLoadedState) {
      try {
        final dashboardData = await _getDashboardDataUseCase.execute();

        if (dashboardData.user == null) {
          emit(const DashboardErrorState(
              'No se pudo obtener la información del usuario.'));
          return;
        }

        emit(DashboardLoadedState(
          user: dashboardData.user!,
          courses: dashboardData.courses,
          events: dashboardData.events,
          progress: dashboardData.progress,
          leaderboard: dashboardData.leaderboard,
          pendingTasks: dashboardData.pendingTasks,
          selectedDate: currentState.selectedDate,
        ));
      } catch (e) {
        emit(DashboardErrorState('Error al refrescar datos: $e'));
      }
    } else {
      add(const LoadDashboardEvent());
    }
  }

  Future<void> _onSelectDate(
    SelectDateEvent event,
    Emitter<DashboardState> emit,
  ) async {
    final currentState = state;
    if (currentState is DashboardLoadedState) {
      emit(currentState.copyWith(
        selectedDate: event.date,
      ));
    }
  }
}
