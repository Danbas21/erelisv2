part of 'salon_bloc.dart';

@freezed
sealed class SalonEvent with _$SalonEvent {
  const factory SalonEvent.fetchSubjects() = _FetchSubjects;
  const factory SalonEvent.toggleSidebar() = _ToggleSidebar;
}
