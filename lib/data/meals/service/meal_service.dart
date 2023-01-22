import 'package:tashil_food_app/data/firebase/crud_firebase.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';

class MealService {
  Future<MealModel> getMealWhereID({
    required String idMeal,
  }) async {
    final meal = await CrudFirebase()
        .readDataOneRow(tableName: MealModel().tableName, id: idMeal);

    if (meal != null) {
      final data = MealModel.fromJson(meal);
      return data;
    } else {
      throw Exception('Gagal Login');
    }
  }

  static viewAllMeals(int limit) async {
    var response =
        await CrudFirebase().readDataLimit(tableName: 'Meals', limit: limit);
    return response.fold((l) => l, (r) => r);
  }
}
