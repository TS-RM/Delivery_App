import 'package:get/get.dart';
import 'package:tashil_food_app/data/firebase/crud_firebase.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';
import 'package:tashil_food_app/data/category/model/category_model.dart';
import 'package:tashil_food_app/data/home/service/home_services.dart';

class CategoryPageController extends GetxController {
  dynamic argumentData = Get.arguments;
  var restaurantData = CategoryModel().obs;
  var mealModel = <MealModel>[].obs;
  RxInt count = 0.obs;
  var loading = true.obs;
  @override
  void onInit() async {
    viewCategoryById(argumentData[0]['id']);
    countCategory(argumentData[0]['id']);
    super.onInit();
  }

  void viewCategoryById(String value) async {
    var response = await HomeServices.viewCategoryById(value);
    if (response != null) {
      final dataList =
          (response as List).map((e) => CategoryModel.fromJson(e)).toList();
      restaurantData.value = dataList[0];
      viewMealsForCategory(value);
    }
  }

  void countCategory(String id) async {
    var response = await CrudFirebase()
        .getCountRow(tableName: 'Meals', fieldName: 'category', value: id);
    count.value = response;
  }

  void viewMealsForCategory(String value) async {
    var response = await HomeServices.viewMealsForCategory(value);
    if (response != null) {
      final dataList =
          (response as List).map((e) => MealModel.fromJson(e)).toList();
      mealModel.assignAll(dataList);
      loading.value = false;
    }
  }
}
