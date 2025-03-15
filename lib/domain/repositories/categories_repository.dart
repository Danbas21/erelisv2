import 'package:erelis/data/models/category_model.dart';

abstract class CategoriesRepository {
  Future<List<CategoryModel>> getCategories();
  Future<CategoryModel?> getCategoryById(String id);
}
