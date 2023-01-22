import 'package:get/get.dart';

import '../controllers/review_rating_meal_controllers.dart';

class PreviewRatingMealBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PreviewRatingMealController());
  }
}
