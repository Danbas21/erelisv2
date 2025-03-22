part of 'salon_bloc.dart';

@freezed
sealed class SalonEvent with _$SalonEvent {
  const factory SalonEvent.fetchSubjects() = _FetchSubjects;
  const factory SalonEvent.toggleSidebar() = _ToggleSidebar;
  const factory SalonEvent.loadCourses() = _LoadCourses;
  const factory SalonEvent.loadCourseDetails({required String courseId}) =
      _LoadCourseDetails;
  const factory SalonEvent.addCourse({required SubjectModel subject}) =
      _AddCourse;
  const factory SalonEvent.updateCourse({required List<SubjectModel> course}) =
      _UpdateCourse;

  const factory SalonEvent.deleteCourse({required String courseId}) =
      _DeleteCourse;
  const factory SalonEvent.loadCoursesSuccess(List<SubjectModel> courses) =
      _LoadCoursesSuccess;
}
