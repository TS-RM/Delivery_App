import 'package:get/get.dart';

import '../controllers/resturant_controller.dart';

class RestaurantBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RestaurantController());
  }
}
