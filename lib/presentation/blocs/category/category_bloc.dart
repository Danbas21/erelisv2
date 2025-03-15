import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:erelis/domain/repositories/categories_repository.dart';
import 'package:erelis/presentation/blocs/category/category_event.dart';
import 'package:erelis/presentation/blocs/category/category_state.dart';
import 'package:erelis/data/models/category_model.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoriesRepository categoriesRepository;

  CategoryBloc({required this.categoriesRepository})
      : super(CategoryInitial()) {
    on<FetchCategories>(_onFetchCategories);
    on<SelectCategory>(_onSelectCategory);
  }

  void _onFetchCategories(
    FetchCategories event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryLoading());
    try {
      // En un escenario real, obtendríamos los datos del repositorio
      // final categories = await categoriesRepository.getCategories();

      // Para desarrollo, usaremos datos mockeados
      final categories = CategoryModel.getMockCategories();

      emit(CategoryLoaded(categories: categories));
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }

  void _onSelectCategory(SelectCategory event, Emitter<CategoryState> emit) {
    final currentState = state;
    if (currentState is CategoryLoaded) {
      emit(
        CategoryLoaded(
          categories: currentState.categories,
          selectedCategoryId: event.categoryId,
        ),
      );
    }
  }
}
