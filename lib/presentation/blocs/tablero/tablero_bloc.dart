import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:erelis/features/tablero/domain/entities/course_progress_entity.dart';
import 'package:erelis/features/tablero/domain/entities/exam_entity.dart';
import 'package:erelis/features/tablero/domain/entities/leader_entity.dart';
import 'package:erelis/features/tablero/domain/entities/user_profile_entity.dart';
import 'package:erelis/features/tablero/domain/usecases/get_course_progress_usecase.dart';
import 'package:erelis/features/tablero/domain/usecases/get_exams_usecase.dart';
import 'package:erelis/features/tablero/domain/usecases/get_leaders_usecase.dart';
import 'package:erelis/features/tablero/domain/usecases/get_user_profile_usecase.dart';
import 'package:erelis/features/tablero/domain/usecases/update_course_progress_usecase.dart';

part 'tablero_event.dart';
part 'tablero_state.dart';
part 'tablero_bloc.freezed.dart';

class TableroBloc extends Bloc<TableroEvent, TableroState> {
  final GetLeadersUseCase getLeadersUseCase;
  final GetCourseProgressUseCase getCourseProgressUseCase;
  final GetExamsUseCase getExamsUseCase;
  final GetUserProfileUseCase getUserProfileUseCase;
  final UpdateCourseProgressUseCase updateCourseProgressUseCase;

  TableroBloc({
    required this.getLeadersUseCase,
    required this.getCourseProgressUseCase,
    required this.getExamsUseCase,
    required this.getUserProfileUseCase,
    required this.updateCourseProgressUseCase,
  }) : super(const TableroState.initial()) {
    on<_Started>(_onStarted);
    on<_UpdateCourseProgress>(_onUpdateCourseProgress);
  }

  Future<void> _onStarted(_Started event, Emitter<TableroState> emit) async {
    emit(const TableroState.loading());

    try {
      final leaders = await getLeadersUseCase();
      final courseProgress = await getCourseProgressUseCase();
      final exams = await getExamsUseCase();
      final userProfile = await getUserProfileUseCase();

      emit(TableroState.loaded(
        leaders: leaders,
        courseProgress: courseProgress,
        exams: exams,
        userProfile: userProfile,
        announcement: "Hola continuemos", // Hardcoded for now as requested
      ));
    } catch (e) {
      emit(TableroState.error(message: e.toString()));
    }
  }

  Future<void> _onUpdateCourseProgress(
      _UpdateCourseProgress event, Emitter<TableroState> emit) async {
    final currentState = state;

    if (currentState is Loaded) {
      try {
        await updateCourseProgressUseCase(
          progressId: event.progressId,
          completed: event.completed,
        );

        // Reload course progress
        final updatedProgress = await getCourseProgressUseCase();

        emit(currentState.copyWith(courseProgress: updatedProgress));
      } catch (e) {
        emit(TableroState.error(message: e.toString()));
      }
    }
  }
}
