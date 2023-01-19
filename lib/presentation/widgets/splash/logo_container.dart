import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/constants/path_const/image_asset.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      width: 200.w,
      height: 200.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: fullColorLogo,
      ),
      child: Image.asset(
        ImageAsset.logo,
      ),
    );
  }
}
