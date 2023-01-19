import 'package:get/get.dart';
import '../controllers/checkout_controller.dart';

class CheckoutBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      CheckoutController(),
      permanent: true,
    ); // permanent: true
  }
}
