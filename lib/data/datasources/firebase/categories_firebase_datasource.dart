import 'package:erelis/data/models/category_model.dart';

class CategoriesFirebaseDataSource {
  // En un escenario real, estas funciones interactuarían con Firestore
  // Para desarrollo, se han simulado los comportamientos

  Future<List<CategoryModel>> getCategories() async {
    try {
      // Simulamos la obtención de datos de Firestore
      // final snapshot = await _firestore.collection(_collectionName).get();
      // return snapshot.docs.map((doc) => CategoryModel.fromJson(doc.data())).toList();

      // Para desarrollo, simulamos un retraso en la red
      await Future.delayed(Duration(milliseconds: 600));
      return CategoryModel.getMockCategories();
    } catch (e) {
      throw Exception('Error al obtener categorías desde Firebase: $e');
    }
  }

  Future<CategoryModel?> getCategoryById(String id) async {
    try {
      // Simulamos la obtención de un documento específico de Firestore
      // final doc = await _firestore.collection(_collectionName).doc(id).get();
      // if (doc.exists) {
      //   return CategoryModel.fromJson(doc.data()!);
      // }
      // return null;

      // Para desarrollo, simulamos un retraso en la red
      await Future.delayed(Duration(milliseconds: 400));

      final allCategories = CategoryModel.getMockCategories();
      try {
        return allCategories.firstWhere((category) => category.id == id);
      } catch (e) {
        return null; // Categoría no encontrada
      }
    } catch (e) {
      throw Exception('Error al obtener categoría por ID desde Firebase: $e');
    }
  }
}
