import 'package:get/get.dart';

import '../controllers/category_page_controller.dart';

class ResturantBageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoryPageController());
  }
}
