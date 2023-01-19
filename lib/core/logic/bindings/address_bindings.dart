import 'package:get/get.dart';

import '../controllers/address/address_controllers.dart';

class AddressBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AddressController());
  }
}
