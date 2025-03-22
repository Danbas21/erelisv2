part of 'unit_detail_bloc.dart';

@freezed
sealed class UnitDetailEvent with _$UnitDetailEvent {
  const factory UnitDetailEvent.loadUnit({
    required String unitId,
    required String courseId,
  }) = _LoadUnit;

  const factory UnitDetailEvent.highlightText({
    required String text,
    required String color,
  }) = _HighlightText;
  const factory UnitDetailEvent.markAsCompleted() = _MarkAsCompleted;
}
