part of 'salon_bloc.dart';

@freezed
sealed class SalonState with _$SalonState {
  const factory SalonState({
    @Default([]) List<SubjectModel> subjects,
    @Default(true) bool isSidebarExpanded,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _SalonState;
  const factory SalonState.initial() = Initial;
  const factory SalonState.loadInProgress() = LoadInProgress;
  const factory SalonState.loaded({required List<SubjectModel> subject}) =
      Loaded;
  const factory SalonState.detailsLoaded({required SubjectModel subject}) =
      DetailsLoaded;

  const factory SalonState.courseOperationSuccess({required String message}) =
      CourseOperationSuccess;
  const factory SalonState.courseError({required String message}) = CourseError;
}
