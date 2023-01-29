import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tashil_food_app/constants/init/init_boxses.dart';
import 'package:tashil_food_app/constants/locale/locale.dart';
import 'package:tashil_food_app/constants/static_data/my_string.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/data/settings/service/settings_service.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class DropdownMenuItemLanguage extends StatelessWidget {
  const DropdownMenuItemLanguage({
    Key? key,
  }) : super(key: key);
  // final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Boxes.getLangData().listenable(),
      builder: (context, box, widget) {
        var isLang = box.get('isLang');
        isLang != null ? null : isLang = 'en';
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
          trailing: SizedBox(
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
                    value: ene,
                    child: Text(
                      english,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: appBarPreferredSizeColor,
                      ),
                    ),
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
                    value: ara,
                    child: Text(
                      arabic,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: appBarPreferredSizeColor,
                      ),
                    ),
                  ),
                ],
                value: isLang == 'en' ? 'en' : 'ar',
                // value:  SettingsService().getSettingsData()?.isLang == 'en'
                //     ? 'en'
                //     : 'ar',
                // value: SharedPref.instance.getString("curruntLang") == 'en'
                //     ? 'en'
                //     : 'ar',
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
      },
    );
  }
}
