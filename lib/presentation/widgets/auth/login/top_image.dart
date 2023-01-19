import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/constants/path_const/image_asset.dart';

class TopImage extends StatelessWidget {
  const TopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAsset.splashLogo,
      height: 205.h,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
