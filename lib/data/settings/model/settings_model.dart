import 'package:hive/hive.dart';

part 'settings_model.g.dart';

@HiveType(typeId: 7)
class SettingsModel extends HiveObject {
  @HiveField(0)
  bool? isShowSplash;

  @HiveField(1)
  bool? isDarkMode;

  @HiveField(2)
  String? isLang;
}
