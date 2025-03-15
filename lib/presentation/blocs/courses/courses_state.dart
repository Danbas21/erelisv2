import 'package:equatable/equatable.dart';
import 'package:erelis/data/models/course_model.dart';

abstract class CoursesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CoursesInitial extends CoursesState {}

class CoursesLoading extends CoursesState {}

class CoursesLoaded extends CoursesState {
  final List<CourseModel> courses;
  final String activeCategory;
  final String searchQuery;

  CoursesLoaded({
    required this.courses,
    this.activeCategory = '',
    this.searchQuery = '',
  });

  @override
  List<Object?> get props => [courses, activeCategory, searchQuery];
}

class CoursesError extends CoursesState {
  final String message;

  CoursesError({required this.message});

  @override
  List<Object?> get props => [message];
}
