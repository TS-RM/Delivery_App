// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/locale/locale.dart';
import 'package:tashil_food_app/constants/static_data/my_string.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class DropdownMenuItemLanguage extends StatelessWidget {
  const DropdownMenuItemLanguage({
    Key? key,
  }) : super(key: key);
  // final controller = Get.find<SettingsController>();
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.language,
        color: Theme.of(context).textTheme.headlineLarge!.color,
      ),
      title: TextWithFont().textShow(
        text: 'Language'.tr,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).textTheme.headlineLarge!.color,
      ),
      trailing: Container(
        width: 90,
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            iconSize: 20,
            icon: Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).textTheme.headlineLarge!.color,
            ),
            items: [
              DropdownMenuItem(
                child: Text(
                  english,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: appBarPreferredSizeColor,
                  ),
                ),
                value: ene,
              ),
              // DropdownMenuItem(
              //   child: Text(
              //     turkish,
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 13,
              //       color: appBarPreferredSizeColor,
              //     ),
              //   ),
              //   value: tuk,
              // ),
              DropdownMenuItem(
                child: Text(
                  arabic,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: appBarPreferredSizeColor,
                  ),
                ),
                value: ara,
              ),
            ],
            value: SharedPref.instance.getString("curruntLang") == 'en'
                ? 'en'
                : 'ar',
                // SharedPref.instance.getString("curruntLang") == 'ar' ?
                //   'ar' : 'tr',
            onChanged: (value) {
              MyLocaleController().changeLang(value!);
              Get.updateLocale(Locale(value));
            },
          ),
        ),
      ),
    );
  }
}
