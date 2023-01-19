import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';

class ThemeController {
  final key = 'isDarkModes';

  saveThemeDataInBox(bool isDark) {
    SharedPref.instance.setBool(key, isDark);
  }

  bool getThemeDataFromBox() {
    return SharedPref.instance.getBool(key) ?? false;
  }

  ThemeMode get themeDataGet =>
      getThemeDataFromBox() ? ThemeMode.dark : ThemeMode.light;

  void changesTheme() {
    Get.changeThemeMode(
        getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeDataInBox(!getThemeDataFromBox());
  }
}
