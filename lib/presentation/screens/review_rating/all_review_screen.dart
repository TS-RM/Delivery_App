import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/enums/status_request.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/core/logic/controllers/review_product_controllers.dart';
import 'package:tashil_food_app/core/helper/handling_data_view.dart';
import 'package:tashil_food_app/presentation/widgets/get_snackbar.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

import '../../widgets/auth/auth_button.dart';
import '../../widgets/review/app_bar_rev.dart';
import '../../widgets/review/card_rev.dart';
import '../../widgets/review/review_rating.dart';

class AllReviewScreen extends StatelessWidget {
  AllReviewScreen({Key? key}) : super(key: key);
  final reviewController = Get.find<PreviewProductController>();

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
                  GetBuilder<PreviewProductController>(builder: (_) {
                    return HandlingDataView(
                        statusRequest: StatusRequest.success,
                        widget: Container(
                          width: double.infinity,
                          height: Get.height * .7,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: reviewController.reviewProduct.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CardRev(
                                data: reviewController.reviewProduct[index],
                              );
                            },
                          ),
                        ));
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
                  ),
                  child: AuthButton(
                    press: () {
                      SharedPref.instance.getString('token') == null
                        ? getSnackbar(
                            title: "Error".tr,
                            supTitle: "You must login with account".tr,
                          )
                        : Get.offAndToNamed(ScreenName.writeReviewScreen,
                                arguments: {
                                  'prodectId': reviewController.idProduct
                                });
                          },
                    text: 'Write Review'.tr,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
