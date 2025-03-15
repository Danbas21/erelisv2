part of 'tablero_bloc.dart';

@freezed
class TableroEvent with _$TableroEvent {
  const factory TableroEvent.started() = _Started;

  const factory TableroEvent.updateCourseProgress({
    required String progressId,
    required bool completed,
  }) = _UpdateCourseProgress;
}
