import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:erelis/features/salon/domain/repositories/subjects_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:erelis/features/salon/domain/models/subject_model.dart';

part 'salon_state.dart';
part 'salon_event.dart';
part 'salon_bloc.freezed.dart';

class SalonBloc extends Bloc<SalonEvent, SalonState> {
  final SubjectsRepository _subjectsRepository;
  StreamSubscription? _coursesSubscription;

  SalonBloc({
    required SubjectsRepository subjectsRepository,
  })  : _subjectsRepository = subjectsRepository,
        super(const SalonState()) {
    on<_LoadCourses>(_onLoadCourses);
    on<_LoadCourseDetails>(_onLoadCourseDetails);
    on<_AddCourse>(_onAddCourse);
    on<_UpdateCourse>(_onUpdateCourse);
    on<_DeleteCourse>(_onDeleteCourse);
    on<_LoadCoursesSuccess>(_onLoadCoursesSuccess);
  }

  Future<void> _onLoadCourses(
    _LoadCourses event,
    Emitter<SalonState> emit,
  ) async {
    emit(SalonState.loadInProgress());
    try {
      // Cancelar la suscripción anterior
      await _coursesSubscription?.cancel();

      // IMPORTANTE: NO emitas estados dentro de la suscripción
      // En su lugar, espera a que los datos lleguen primero
      final courses = await _subjectsRepository.getCoursesAsList();
      emit(SalonState.loaded(subject: courses));

      // Ahora configura la suscripción para actualizaciones futuras,
      // pero no emitas estados desde aquí
      _coursesSubscription =
          _subjectsRepository.getCoursesStream().listen((updatedCourses) {
        // Usa add() aquí en lugar de emit() directamente
        add(_LoadCoursesSuccess(updatedCourses));
      });
    } catch (e) {
      emit(
        SalonState.courseError(
          message: 'Error al cargar cursos: ${e.toString()}',
        ),
      );
    }
  }

  FutureOr<void> _onLoadCoursesSuccess(
    _LoadCoursesSuccess event,
    Emitter<SalonState> emit,
  ) {
    emit(SalonState.loaded(subject: event.courses));
  }

  FutureOr<void> _onLoadCourseDetails(
    _LoadCourseDetails event,
    Emitter<SalonState> emit,
  ) async {
    emit(SalonState.loadInProgress());
    try {
      final course = await _subjectsRepository.getCourseById(event.courseId);
      emit(SalonState.detailsLoaded(subject: course));
      // ignore: avoid_print
      print('Cargando detalles del curso con ID real: $course');
    } catch (e) {
      emit(
        SalonState.courseError(
          message: 'Error al cargar detalles del curso: ${e.toString()}',
        ),
      );
    }
  }

  FutureOr<void> _onAddCourse(
    _AddCourse event,
    Emitter<SalonState> emit,
  ) async {
    emit(SalonState.loadInProgress());
    try {
      await _subjectsRepository.addCourse(event.subject);
      emit(
        SalonState.courseOperationSuccess(message: 'Curso añadido con éxito'),
      );
    } catch (e) {
      emit(
        SalonState.courseError(
          message: 'Error al añadir curso: ${e.toString()}',
        ),
      );
    }
  }

  FutureOr<void> _onUpdateCourse(
    _UpdateCourse event,
    Emitter<SalonState> emit,
  ) async {
    emit(SalonState.loadInProgress());
    try {
      await _subjectsRepository.getCourseById('');
      emit(
        SalonState.courseOperationSuccess(
          message: 'Curso actualizado con éxito',
        ),
      );
    } catch (e) {
      emit(
        SalonState.courseError(
          message: 'Error al actualizar curso: ${e.toString()}',
        ),
      );
    }
  }

  FutureOr<void> _onDeleteCourse(
    _DeleteCourse event,
    Emitter<SalonState> emit,
  ) async {
    emit(SalonState.loadInProgress());
    try {
      await _subjectsRepository.deleteCourse(event.courseId);
      emit(
        SalonState.courseOperationSuccess(
          message: 'Curso eliminado con éxito',
        ),
      );

      // Opcional: después de eliminar, cargar la lista actualizada
      add(const SalonEvent.loadCourses());
    } catch (e) {
      emit(
        SalonState.courseError(
          message: 'Error al eliminar curso: ${e.toString()}',
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _coursesSubscription?.cancel();
    return super.close();
  }
}
