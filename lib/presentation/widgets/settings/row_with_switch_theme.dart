import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/core/logic/controllers/settings_controller.dart';
import 'package:tashil_food_app/core/logic/controllers/theme_controller.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class RowWithSwitchTheme extends StatelessWidget {
  RowWithSwitchTheme({
    Key? key,
    required this.text,
    required this.icon,
    required this.paddingSize,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final double paddingSize;

  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).textTheme.headlineLarge!.color,
        ),
        title: TextWithFont().textShow(
          text: text,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: Theme.of(context).textTheme.headlineLarge!.color,
        ),
        trailing: SizedBox(
          width: 50.w,
          child: FlutterSwitch(
            height: 22.0,
            width: 55.0,
            padding: 1.5,
            toggleSize: 20.0,
            borderRadius: 13.0,
            activeColor: const Color.fromRGBO(39, 174, 96, 1),
            value: controller.switchThemeValue.value,
            onToggle: (value) {
              ThemeController().changesTheme();
              controller.switchThemeValue.value = value;
              print(value);
            },
          ),
        ),
      ),
    );
  }
}
