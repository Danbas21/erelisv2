part of 'units_bloc.dart';

@freezed
sealed class UnitsState with _$UnitsState {
  const factory UnitsState.initial() = Initial;
  const factory UnitsState.loading() = Loading;
  const factory UnitsState.loaded({
    required List<Unit> units,
    required bool hasMoreUnits,
    required int displayedCount,
  }) = Loaded;
  // Añadir este estado
  const factory UnitsState.empty(String message) = Empty;
  const factory UnitsState.error(String message) = Error;
}
