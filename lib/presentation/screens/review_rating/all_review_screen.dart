import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/enums/status_request.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/review_rating_meal_controllers.dart';
import 'package:tashil_food_app/core/helper/handling_data_view.dart';
import 'package:tashil_food_app/data/auth/service/hive_auth.dart';
import 'package:tashil_food_app/presentation/widgets/get_snackbar.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

import '../../widgets/auth/auth_button.dart';
import '../../widgets/review/app_bar_rev.dart';
import '../../widgets/review/card_rev.dart';
import '../../widgets/review/review_rating.dart';

class AllReviewScreen extends StatelessWidget {
  AllReviewScreen({Key? key}) : super(key: key);
  final reviewController = Get.find<PreviewRatingMealController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarRev(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  ReviewRating(),
                  SizedBox(
                    height: 20.h,
                  ),
                  GetBuilder<PreviewRatingMealController>(builder: (_) {
                    return reviewController.isLoading
                        ? Center(
                            child: CircularProgressIndicator(color: mainColor),
                          )
                        : SizedBox(
                            width: double.infinity,
                            height: Get.height * .7,
                            child: !reviewController.isNull
                                ? ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: reviewController
                                        .reviewRatingMeal.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return CardRev(
                                        ratingModel: reviewController
                                            .reviewRatingMeal[index],
                                      );
                                    },
                                  )
                                : Center(
                                    child: Text(
                                      reviewController.notDataRating.toString(),
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .color!
                                            .withOpacity(.5),
                                      ),
                                    ),
                                  ),
                          );
                  }),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: HiveAuth().getDataUser() != null
                      ? GetBuilder<PreviewRatingMealController>(
                          builder: (_) {
                            if (reviewController.isLoading) {
                              return Center(
                                child:
                                    CircularProgressIndicator(color: mainColor),
                              );
                            } else {
                              return reviewController.ratingUser != null
                                  ? AuthButton(
                                      press: () {
                                        Get.offAndToNamed(
                                            ScreenName.editReviewScreen,
                                            arguments: {
                                              'ratingUser':
                                                  reviewController.ratingUser
                                            });
                                        reviewController.getEdit();
                                      },
                                      text: 'edit Review'.tr,
                                    )
                                  : AuthButton(
                                      press: () {
                                        Get.offAndToNamed(
                                            ScreenName.writeReviewScreen,
                                            arguments: {
                                              'mealID':
                                                  reviewController.idProduct
                                            });
                                      },
                                      text: 'Write Review'.tr,
                                    );
                            }
                          },
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextWithFont().textShow(
                            color: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .color,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal,
                            text: "You must login with account".tr,
                          ),
                        ),

                  // AuthButton(
                  //   press: () {
                  //     SharedPref.instance.getString('token') == null
                  //       ? getSnackbar(
                  //           title: "Error".tr,
                  //           supTitle: "You must login with account".tr,
                  //         )
                  //       : Get.offAndToNamed(ScreenName.writeReviewScreen,
                  //               arguments: {
                  //                 'prodectId': reviewController.idProduct
                  //               });
                  //         },
                  //   text: 'Write Review'.tr,
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
