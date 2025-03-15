part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

class DashboardInitialState extends DashboardState {
  const DashboardInitialState();
}

class DashboardLoadingState extends DashboardState {
  const DashboardLoadingState();
}

class DashboardLoadedState extends DashboardState {
  final UserEntity user;
  final List<CourseEntity> courses;
  final List<EventEntity> events;
  final List<ProgressEntity> progress;
  final List<LeaderboardEntry> leaderboard;
  final List<TaskEntity> pendingTasks;
  final DateTime selectedDate;

  const DashboardLoadedState({
    required this.user,
    required this.courses,
    required this.events,
    required this.progress,
    required this.leaderboard,
    required this.pendingTasks,
    required this.selectedDate,
  });

  @override
  List<Object?> get props => [
        user,
        courses,
        events,
        progress,
        leaderboard,
        pendingTasks,
        selectedDate,
      ];

  DashboardLoadedState copyWith({
    UserEntity? user,
    List<CourseEntity>? courses,
    List<EventEntity>? events,
    List<ProgressEntity>? progress,
    List<LeaderboardEntry>? leaderboard,
    List<TaskEntity>? pendingTasks,
    DateTime? selectedDate,
  }) {
    return DashboardLoadedState(
      user: user ?? this.user,
      courses: courses ?? this.courses,
      events: events ?? this.events,
      progress: progress ?? this.progress,
      leaderboard: leaderboard ?? this.leaderboard,
      pendingTasks: pendingTasks ?? this.pendingTasks,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }
}

class DashboardErrorState extends DashboardState {
  final String message;

  const DashboardErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
