import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/review_product_controllers.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

import '../../widgets/review/rating_bar.dart';

class WriteReviewScreen extends StatelessWidget {
  WriteReviewScreen({Key? key}) : super(key: key);
  final reviewController = Get.find<PreviewProductController>();
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: TextWithFont().textShow(
            color: Theme.of(context).textTheme.headlineLarge!.color,
            fontSize: 20.sp,
            text: 'Write Review'.tr,
            fontWeight: FontWeight.bold),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              TextWithFont().textShow(
                  color: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .color!
                      .withOpacity(.6),
                  fontSize: 14.sp,
                  text:
                      'Please write overall level of satisfaction with your shipping / Delivery Service'.tr,
                  fontWeight: FontWeight.w500),
              SizedBox(
                height: 20.h,
              ),
              const RatingBarReview(),
              SizedBox(
                height: 40.h,
              ),
              TextWithFont().textShow(
                  color: Theme.of(context).textTheme.headlineLarge!.color!,
                  fontSize: 14.sp,
                  text: 'Write Your Review'.tr,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: 8.h,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: myController,
                  minLines: 6,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text'.tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    fillColor: Get.isDarkMode
                        ? Theme.of(context).cardColor
                        : authTextFromFieldFillColor.withOpacity(.3),
                    hintText: 'Write your review here'.tr,
                    hintStyle: TextStyle(
                      color: authTextFromFieldHintTextColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: authTextFromFieldPonderColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: authTextFromFieldPonderColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * .1,
              ),
              GetBuilder<PreviewProductController>(builder: (_) {
                return Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          String feedback = myController.text.trim();
                          await reviewController.addReviewProduct(
                              feedback,
                              reviewController.rating.toInt(),
                              reviewController.idProduct.toString());
                          // reviewController.showProductReviews(
                          //     reviewController.idProdect.toString());

                          Get.offNamed(ScreenName.allReviewScreen, arguments: {
                            'prodectId': reviewController.idProduct!.toInt()
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.white,
                        side: BorderSide.none,
                        // primary:,
                        minimumSize: Size(120.w, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: TextWithFont().textShow(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        text: 'Save'.tr,
                      )),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
