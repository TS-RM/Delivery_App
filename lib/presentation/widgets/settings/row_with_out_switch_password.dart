import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/presentation/widgets/get_snackbar.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

class RowWithoutSwitchPassword extends StatelessWidget {
  const RowWithoutSwitchPassword({
    super.key,
    required this.text,
    required this.icon,
    required this.paddingSize,
    required this.sizedBoxWidth,
  });

  final String text;
  final IconData icon;
  final double paddingSize;
  final double sizedBoxWidth;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SharedPref.instance.getString('token') == null
            ? getSnackbar(
                title: "Error".tr,
                supTitle: "You must login with account".tr,
              )
            : Get.toNamed(ScreenName.updatePassword);
      },
      child: ListTile(
        // children: [
        // Icons.person_outline
        leading: Icon(
          icon,
          color: Theme.of(context).iconTheme.color,
        ),

        title: TextWithFont().textShow(
          text: text,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: Theme.of(context).textTheme.headlineLarge!.color,
        ),

        //  Icons.arrow_forward_ios_rounded
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 20,
          color: Theme.of(context).iconTheme.color,
        ),

        // ],
      ),
    );
  }
}
