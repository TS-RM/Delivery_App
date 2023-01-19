import 'package:get/get.dart';
import 'package:tashil_food_app/core/logic/controllers/connection_manager_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<ConnectionManagerController>(
    //     () => ConnectionManagerController());
    Get.put(ConnectionManagerController());
  }
}
