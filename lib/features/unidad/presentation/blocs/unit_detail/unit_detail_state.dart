part of 'unit_detail_bloc.dart';

@freezed
sealed class HighlightData with _$HighlightData {
  const factory HighlightData({
    required String text,
    required String color,
  }) = _HighlightData;
}

@freezed
sealed class UnitDetailState with _$UnitDetailState {
  const factory UnitDetailState.initial() = Initial;
  const factory UnitDetailState.loading() = Loading;
  const factory UnitDetailState.loaded({
    required Unit unit,
    required List<HighlightData> highlights,
  }) = Loaded;
  const factory UnitDetailState.error(String message) = Error;
}
