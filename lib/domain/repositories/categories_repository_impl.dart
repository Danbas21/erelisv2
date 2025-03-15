import 'package:erelis/data/datasources/firebase/categories_firebase_datasource.dart';
import 'package:erelis/data/models/category_model.dart';
import 'package:erelis/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesFirebaseDataSource remoteDataSource;

  CategoriesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      // En un escenario real, se obtendría la información desde Firebase
      // return await remoteDataSource.getCategories();

      // Para desarrollo, usamos datos mockeados
      return CategoryModel.getMockCategories();
    } catch (e) {
      throw Exception('Error al obtener categorías: $e');
    }
  }

  @override
  Future<CategoryModel?> getCategoryById(String id) async {
    try {
      // En un escenario real, se obtendría una categoría específica desde Firebase
      // return await remoteDataSource.getCategoryById(id);

      // Para desarrollo, buscamos en los datos mockeados
      final allCategories = CategoryModel.getMockCategories();
      return allCategories.firstWhere(
        (category) => category.id == id,
        orElse: () => throw Exception('Categoría no encontrada'),
      );
    } catch (e) {
      throw Exception('Error al obtener categoría por ID: $e');
    }
  }
}
