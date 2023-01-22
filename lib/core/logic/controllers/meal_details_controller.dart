import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/data/category/model/category_model.dart';
import 'package:tashil_food_app/data/category/service/category_service.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';

class MealDetailsController extends GetxController {
  Rx<MealModel> mealsData = MealModel().obs;
  final CategoryService categoryService = CategoryService();

  var isLoading = true.obs;
  var counter = 1.obs;

  RxString category = ''.obs;
  var storage = SharedPref.instance;

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
    super.onInit();
  }

  getCategory(MealModel mealModel) async {
    final data = storage.getString('homeCategoryList');
    final encodedData = CategoryModel.decode(data.toString());
    final index =
        encodedData.indexWhere((element) => element.id == mealModel.category);
    if (index >= 0) {
      category.value = encodedData[index].name.toString();
    }
  }
}
