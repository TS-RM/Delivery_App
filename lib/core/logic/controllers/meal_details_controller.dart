import 'package:get/get.dart';
import 'package:tashil_food_app/data/category/service/category_hive_service.dart';
import 'package:tashil_food_app/data/category/service/category_service.dart';
import 'package:tashil_food_app/data/firebase/crud_firebase.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';
import 'package:tashil_food_app/data/rating/model/rating_model.dart';

class MealDetailsController extends GetxController {
  Rx<MealModel> mealsData = MealModel().obs;
  // final CategoryService categoryService = CategoryService();

  var isLoading = true.obs;
  var counter = 1.obs;

  RxInt countRatingMeal = 0.obs;

  RxString category = ''.obs;

  void plusCounter() {
    counter.value++;
  }

  void lessCounter() {
    if (counter.value > 1) {
      counter.value--;
    }
  }

  @override
  void onInit() async {
    var data = Get.arguments[0]['MealData'] as MealModel;
    mealsData.value = data;
    isLoading.value = false;
    counter.value = 1;
    getCategory(data);
    getCountRating(data);
    super.onInit();
  }

  getCategory(MealModel mealModel) async {
    final CategoryHiveService localCategory = CategoryHiveService();
    final dataCategory = localCategory.getAllCategory();
    if (dataCategory != null) {
      final index = dataCategory
          .indexWhere((element) => element.id == mealModel.category);
      if (index >= 0) {
        category.value = dataCategory[index].name.toString();
      }
    }
  }

  getCountRating(MealModel mealModel) async {
    var response = await CrudFirebase().getCountRow(
        tableName: RatingModel().tableNme,
        fieldName: 'mealID',
        value: mealModel.id.toString());
    countRatingMeal.value = response;
  }
}
