import 'package:get/get.dart';
import 'package:tashil_food_app/core/logic/controllers/favorites_conntroller.dart';

class FavoritesBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(FavoritesController());
  }
}
