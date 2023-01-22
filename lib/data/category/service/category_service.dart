import 'package:tashil_food_app/data/category/model/category_model.dart';
import 'package:tashil_food_app/data/firebase/crud_firebase.dart';

class CategoryService {
  final CrudFirebase crudFirebase = CrudFirebase();

  Future<CategoryModel?> getCategoryWhereID({
    required String idCategory,
  }) async {
    final meal = await crudFirebase.readDataOneRow(
        tableName: CategoryModel.tableName, id: idCategory);
    // print(meal);
    if (meal != null) {
      final data = CategoryModel.fromJson(meal);
      return data;
    } else {
      return null;
    }
  }
}
