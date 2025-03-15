import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchCategories extends CategoryEvent {}

class SelectCategory extends CategoryEvent {
  final String categoryId;

  SelectCategory({required this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}
