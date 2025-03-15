import 'package:bloc/bloc.dart';
import 'package:erelis/features/salon/domain/repositories/subjects_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:erelis/features/salon/domain/models/subject_model.dart';

part 'salon_state.dart';
part 'salon_event.dart';
part 'salon_bloc.freezed.dart';

class SalonBloc extends Bloc<SalonEvent, SalonState> {
  final SubjectsRepository _subjectsRepository;

  SalonBloc({
    required SubjectsRepository subjectsRepository,
  })  : _subjectsRepository = subjectsRepository,
        super(const SalonState()) {
    on<_FetchSubjects>(_onFetchSubjects);
    on<_ToggleSidebar>(_onToggleSidebar);
  }

  Future<void> _onFetchSubjects(
      _FetchSubjects event, Emitter<SalonState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final subjects = await _subjectsRepository.getSubjects();
      emit(state.copyWith(
        subjects: subjects,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Error al cargar las materias: ${e.toString()}',
      ));
    }
  }

  void _onToggleSidebar(_ToggleSidebar event, Emitter<SalonState> emit) {
    emit(state.copyWith(isSidebarExpanded: !state.isSidebarExpanded));
  }
}
