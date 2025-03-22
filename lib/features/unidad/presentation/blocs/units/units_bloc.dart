import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erelis/features/unidad/domain/entities/unit.dart';
import 'package:erelis/features/unidad/domain/repositories/unit_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'units_state.dart';
part 'units_event.dart';
part 'units_bloc.freezed.dart';

class UnitsBloc extends Bloc<UnitsEvent, UnitsState> {
  final UnitsRepository repository;
  final int initialLoadCount =
      7; // Define este valor como una constante o propiedad
  final int loadMoreCount = 5;

  UnitsBloc({required this.repository}) : super(const UnitsState.initial()) {
    on<_Started>(_onStarted);
    on<_LoadMore>(_onLoadMore);
  }

  Future<void> debugCheckUnits(String courseId, String courseName) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(courseId)
          .collection('units')
          .get();

      if (snapshot.docs.isEmpty) {
      } else {}
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<void> _onStarted(_Started event, Emitter<UnitsState> emit) async {
    emit(const UnitsState.loading());

    try {
      // Ejecutar el diagnóstico
      await debugCheckUnits(event.courseId, event.courseName);

      // Usar el método de carga única
      final result = await repository.getUnitsByCourseOnce(
          event.courseId, event.courseName);

      result.fold((error) {
        emit(UnitsState.error(error.toString()));
      }, (units) {
        print("Unidades cargadas con éxito: ${units.length}");
        if (units.isEmpty) {
          emit(const UnitsState.empty(
              "No hay unidades disponibles para este curso."));
        } else {
          emit(UnitsState.loaded(
            units: units,
            hasMoreUnits: units.length > initialLoadCount,
            displayedCount: units.length > initialLoadCount
                ? initialLoadCount
                : units.length,
          ));
        }
      });
    } catch (e) {
      emit(UnitsState.error(e.toString()));
    }
  }

  Future<void> _onLoadMore(_LoadMore event, Emitter<UnitsState> emit) async {
    final currentState = state;

    if (currentState is Loaded && currentState.hasMoreUnits) {
      int newDisplayCount = currentState.displayedCount + loadMoreCount;
      if (newDisplayCount > currentState.units.length) {
        newDisplayCount = currentState.units.length;
      }

      emit(UnitsState.loaded(
        units: currentState.units,
        hasMoreUnits: newDisplayCount < currentState.units.length,
        displayedCount: newDisplayCount,
      ));
    }
  }
}
