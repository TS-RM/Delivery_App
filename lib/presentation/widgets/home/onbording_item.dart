import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/data/offer/model/model_offer.dart';
import 'package:tashil_food_app/presentation/widgets/home/onboarding_time.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    Key? key,
    required this.offerModel,
  }) : super(key: key);
  final OfferModel offerModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: 380,
            height: 170,
            decoration: BoxDecoration(
              // color: mainColor,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.darken),
                image: AssetImage(offerModel.dataMeals!.image!),
                fit: BoxFit.cover,
              ),
            ),
            // child: Image(
            //   image: AssetImage(offerModel.dataMeals!.image!),
            //   fit: BoxFit.cover,
            // )

            // CachedNetworkImage(
            //   imageUrl: offerListData.product!.image!,
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
        Positioned(
          top: 65.h,
          left: 40.w,
          child: TextWithFont().textShow(
              text: '${offerModel.title} \n ${offerModel.discountPercent}% off',
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              textAlign: TextAlign.center),
        ),
        OnboardingTime(
          deadline: offerModel.deadline!,
        ),
      ],
    );
  }
}
