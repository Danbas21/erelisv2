part of 'tablero_bloc.dart';

@freezed
class TableroState with _$TableroState {
  const factory TableroState.initial() = Initial;

  const factory TableroState.loading() = Loading;

  const factory TableroState.loaded({
    required List<LeaderEntity> leaders,
    required List<CourseProgressEntity> courseProgress,
    required List<ExamEntity> exams,
    required UserProfileEntity userProfile,
    required String announcement,
  }) = Loaded;

  const factory TableroState.error({
    required String message,
  }) = Error;
}
