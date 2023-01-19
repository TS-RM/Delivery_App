import 'package:get/get.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';

class MealDetailsController extends GetxController {
  Rx<MealModel> mealsData = MealModel().obs;

  var isLoading = true.obs;
  var counter = 1.obs;

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

    super.onInit();
  }
}
