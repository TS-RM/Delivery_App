import 'package:tashil_food_app/constants/init/init_boxses.dart';
import 'package:tashil_food_app/data/settings/model/settings_model.dart';

class SettingsService {
  String boxName = 'SettingsBox';

  SettingsModel? getSettingsData() {
    final box = Boxes.getSettingsData();
    final data = box.get(boxName);
    if (data != null) {
      return data;
    } else {
      return null;
    }
  }

  void addSplashData() {
    SettingsModel model = SettingsModel()..isShowSplash = true;
    final box = Boxes.getSettingsData();
    box.put(boxName, model);
  }

  void addLangData(String lang) {
    SettingsModel model = SettingsModel()..isLang = lang;
    final box = Boxes.getSettingsData();
    box.put(boxName, model);
  }

  void addDarkModeData(bool isDark) {
    SettingsModel model = SettingsModel()..isDarkMode = isDark;
    final box = Boxes.getSettingsData();
    box.put(boxName, model);
  }
}
