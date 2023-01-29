import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/init/init_boxses.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/data/settings/service/settings_service.dart';

class ThemeController {
  final key = 'isDarkModes';

  saveThemeDataInBox(bool isDark) {
    SettingsService().addDarkModeData(isDark);
    // SharedPref.instance.setBool(key, isDark);
    final box = Boxes.getDarkModeData();
    box.put('darkMode', isDark);
  }

  bool getThemeDataFromBox() {
    // return SettingsService().getSettingsData()?.isDarkMode ?? false;
    final box = Boxes.getDarkModeData();
    return box.get('darkMode', defaultValue: false);
    // return SharedPref.instance.getBool(key) ?? false;
  }

  ThemeMode get themeDataGet =>
      getThemeDataFromBox() ? ThemeMode.dark : ThemeMode.light;

  void changesTheme() {
    Get.changeThemeMode(
        getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeDataInBox(!getThemeDataFromBox());
  }
}
