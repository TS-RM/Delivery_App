import 'package:get/get.dart';
import 'package:tashil_food_app/core/logic/controllers/order_controller.dart';

class OrderBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderController());
  }
}
