import 'package:get/get.dart';
import 'package:tashil_food_app/core/logic/controllers/meal_details_controller.dart';

class MealDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MealDetailsController());
  }
}
