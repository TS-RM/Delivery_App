import 'package:get/get.dart';

import '../controllers/meals_controller.dart';

class MealsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MealsController());
  }
}
