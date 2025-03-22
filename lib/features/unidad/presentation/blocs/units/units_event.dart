part of 'units_bloc.dart';

@freezed
sealed class UnitsEvent with _$UnitsEvent {
  const factory UnitsEvent.started(String courseId, String courseName) =
      _Started;
  const factory UnitsEvent.loadMore() = _LoadMore;
}
