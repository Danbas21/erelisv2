import 'package:equatable/equatable.dart';

abstract class CoursesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchCourses extends CoursesEvent {}

class FilterCoursesByCategory extends CoursesEvent {
  final String categoryId;

  FilterCoursesByCategory({required this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}

class SearchCourses extends CoursesEvent {
  final String query;

  SearchCourses({required this.query});

  @override
  List<Object?> get props => [query];
}
