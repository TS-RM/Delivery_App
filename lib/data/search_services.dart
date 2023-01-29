import 'package:tashil_food_app/data/firebase/crud_firebase.dart';

class SearchServices {
  static viewMealsSearch(String searchVal) async {
    final response = await CrudFirebase().readDataWhereIsSearch(
        tableName: 'Meals', fieldName1: 'name', value1: searchVal);
    return response;
  }
}
