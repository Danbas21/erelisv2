import '../entities/user_entity.dart';
import '../entities/course_entity.dart';
import '../entities/event_entity.dart';
import '../entities/progress_entity.dart';
import '../entities/leaderboard_entity.dart';
import '../entities/task_entity.dart';
import '../repositories/user_repository.dart';
import '../repositories/course_repository.dart';
import '../repositories/event_repository.dart';
import '../repositories/progress_repository.dart';

class DashboardData {
  final UserEntity? user;
  final List<CourseEntity> courses;
  final List<EventEntity> events;
  final List<ProgressEntity> progress;
  final List<LeaderboardEntry> leaderboard;
  final List<TaskEntity> pendingTasks;

  DashboardData({
    this.user,
    this.courses = const [],
    this.events = const [],
    this.progress = const [],
    this.leaderboard = const [],
    this.pendingTasks = const [],
  });
}

class GetDashboardDataUseCase {
  final UserRepository _userRepository;
  final CourseRepository _courseRepository;
  final EventRepository _eventRepository;
  final ProgressRepository _progressRepository;

  GetDashboardDataUseCase({
    required UserRepository userRepository,
    required CourseRepository courseRepository,
    required EventRepository eventRepository,
    required ProgressRepository progressRepository,
  })  : _userRepository = userRepository,
        _courseRepository = courseRepository,
        _eventRepository = eventRepository,
        _progressRepository = progressRepository;

  Future<DashboardData> execute() async {
    try {
      // Obtener todos los datos necesarios para el dashboard
      final user = await _userRepository.getCurrentUser();
      final courses = await _courseRepository.getUserCourses();
      final events = await _eventRepository.getUpcomingEvents();
      final progress = await _progressRepository.getUserProgress();
      final leaderboard = await _progressRepository.getLeaderboard();
      final pendingTasks = await _courseRepository.getUserPendingTasks();

      return DashboardData(
        user: user,
        courses: courses,
        events: events,
        progress: progress,
        leaderboard: leaderboard,
        pendingTasks: pendingTasks,
      );
    } catch (e) {
      print('Error al obtener datos del dashboard: $e');
      rethrow;
    }
  }
}
