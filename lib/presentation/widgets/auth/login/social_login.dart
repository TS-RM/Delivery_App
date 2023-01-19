import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/constants/path_const/image_asset.dart';
import 'package:tashil_food_app/presentation/widgets/auth/login/socal_card.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SocialCard(
            icon: ImageAsset.facebook,
            press: () {},
          ),
          SocialCard(
            icon: ImageAsset.google,
            press: () {},
          ),
        ],
      ),
    );
  }
}
