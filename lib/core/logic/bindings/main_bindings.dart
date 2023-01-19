import 'package:get/get.dart';
import 'package:tashil_food_app/core/logic/controllers/cart_controllers.dart';
import 'package:tashil_food_app/core/logic/controllers/main_controller.dart';
import 'package:tashil_food_app/core/logic/controllers/settings_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
    Get.put(SettingsController());

    Get.put(MainController());
  }
}
