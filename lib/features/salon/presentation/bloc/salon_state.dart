part of 'salon_bloc.dart';

@freezed
sealed class SalonState with _$SalonState {
  const factory SalonState({
    @Default([]) List<SubjectModel> subjects,
    @Default(true) bool isSidebarExpanded,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _SalonState;
}
