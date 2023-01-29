import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/init/init_boxses.dart';
import 'package:tashil_food_app/constants/static_data/my_string.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/data/settings/service/settings_service.dart';

class MyLocaleController extends GetxController {
  var langLocal = ene.obs;

  @override
  void onInit() async {
    super.onInit();

    // langLocal.value = (SharedPref.instance.getString("curruntLang") != null
    //     ? SharedPref.instance.getString("curruntLang")
    //     : Get.deviceLocale?.languageCode.toString())!;
    // final box = Boxes.getDarkModeData();

    // langLocal.value = (box.get(
    //           'isLang',
    //         ) !=
    //         null
    //     ? box.get('isLang')
    //     : Get.deviceLocale?.languageCode.toString())!;

    // langLocal.value = (SettingsService().getSettingsData()?.isLang != null
    //     ? SettingsService().getSettingsData()?.isLang
    //     : Get.deviceLocale?.languageCode.toString())!;
  }

  String getLang() {
    final box = Boxes.getLangData();
    final isLang = box.get(
      'isLang',
    );
    return isLang.toString();
  }

  void changeLang(String codeLang) {
    langLocal.value = codeLang;
    Locale locale = Locale(codeLang);
    final box = Boxes.getLangData();
    box.put('isLang', codeLang);
    // SettingsService().addLangData(codeLang);
    // SharedPref.instance.setString("curruntLang", codeLang);
    Get.updateLocale(locale);
  }
}
