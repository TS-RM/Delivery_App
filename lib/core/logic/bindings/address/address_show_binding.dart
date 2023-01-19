import 'package:get/get.dart';
import 'package:tashil_food_app/core/logic/controllers/address/address_controllers_show.dart';

class AddressShowBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AddressShowController());
  }
}
