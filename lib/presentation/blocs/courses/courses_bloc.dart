import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erelis/domain/repositories/courses_repository.dart';
import 'package:erelis/presentation/blocs/courses/courses_event.dart';
import 'package:erelis/presentation/blocs/courses/courses_state.dart';
import 'package:erelis/data/models/course_model.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  final CoursesRepository coursesRepository;

  CoursesBloc({required this.coursesRepository}) : super(CoursesInitial()) {
    on<FetchCourses>(_onFetchCourses);
    on<FilterCoursesByCategory>(_onFilterCoursesByCategory);
    on<SearchCourses>(_onSearchCourses);
  }

  void _onFetchCourses(FetchCourses event, Emitter<CoursesState> emit) async {
    emit(CoursesLoading());
    try {
      // En un escenario real, obtendríamos los datos del repositorio
      // final courses = await coursesRepository.getCourses();

      // Para desarrollo, usaremos datos mockeados
      final courses = CourseModel.getMockCourses();

      emit(CoursesLoaded(courses: courses));
    } catch (e) {
      emit(CoursesError(message: e.toString()));
    }
  }

  void _onFilterCoursesByCategory(
    FilterCoursesByCategory event,
    Emitter<CoursesState> emit,
  ) async {
    emit(CoursesLoading());
    try {
      // En un escenario real, filtraríamos los datos desde el repositorio
      // final courses = await coursesRepository.getCoursesByCategory(event.categoryId);

      // Para desarrollo, usaremos datos mockeados y filtraremos localmente
      final allCourses = CourseModel.getMockCourses();
      final filteredCourses = event.categoryId.isEmpty
          ? allCourses
          : allCourses
              .where((course) => course.categoryId == event.categoryId)
              .toList();

      emit(
        CoursesLoaded(
          courses: filteredCourses,
          activeCategory: event.categoryId,
        ),
      );
    } catch (e) {
      emit(CoursesError(message: e.toString()));
    }
  }

  void _onSearchCourses(SearchCourses event, Emitter<CoursesState> emit) async {
    emit(CoursesLoading());
    try {
      // En un escenario real, buscaríamos los datos desde el repositorio
      // final courses = await coursesRepository.searchCourses(event.query);

      // Para desarrollo, usaremos datos mockeados y filtraremos localmente
      final allCourses = CourseModel.getMockCourses();
      final searchQuery = event.query.toLowerCase();

      final searchResults = searchQuery.isEmpty
          ? allCourses
          : allCourses
              .where(
                (course) =>
                    course.title.toLowerCase().contains(searchQuery) ||
                    course.description.toLowerCase().contains(searchQuery),
              )
              .toList();

      emit(CoursesLoaded(courses: searchResults, searchQuery: event.query));
    } catch (e) {
      emit(CoursesError(message: e.toString()));
    }
  }
}
