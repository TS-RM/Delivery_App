import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/my_string.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';

class MyLocaleController extends GetxController {
  var langLocal = ene.obs;

  @override
  void onInit() async {
    super.onInit();

    langLocal.value = (SharedPref.instance.getString("curruntLang") != null
        ? SharedPref.instance.getString("curruntLang")
        : Get.deviceLocale?.languageCode.toString())!;
  }

  void changeLang(String codeLang) {
    langLocal.value = codeLang;
    Locale locale = Locale(codeLang);
    SharedPref.instance.setString("curruntLang", codeLang);
    Get.updateLocale(locale);
  }
}
