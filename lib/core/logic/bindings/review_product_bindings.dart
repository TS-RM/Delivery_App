import 'package:get/get.dart';

import '../controllers/review_product_controllers.dart';

class RreviewProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PreviewProductController());
  }
}
