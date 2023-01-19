// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:tashil_food_app/constants/locale/locale.dart';

class MyLocaleBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MyLocaleController());
  }
}
