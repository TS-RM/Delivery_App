import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/review_rating_meal_controllers.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

import '../../widgets/review/rating_bar.dart';

class EditReviewScreen extends StatelessWidget {
  EditReviewScreen({Key? key}) : super(key: key);
  final reviewController = Get.find<PreviewRatingMealController>();
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = reviewController.ratingUserEdit!.title.toString();
    print(reviewController.ratingUserEdit!.title);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: TextWithFont().textShow(
            color: Theme.of(context).textTheme.headlineLarge!.color,
            fontSize: 20.sp,
            text: 'Edit Review',
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
          child: GetBuilder<PreviewRatingMealController>(builder: (_) {
            return reviewController.isLoading
                ? Center(
                    child: CircularProgressIndicator(color: mainColor),
                  )
                : Column(
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
                          text: 'Edit data the rating ',
                          fontWeight: FontWeight.w500),
                      SizedBox(
                        height: 20.h,
                      ),
                      RatingBarReview(
                          initialRating: reviewController.ratingUserEdit!.rate
                              ?.toDouble()),
                      SizedBox(
                        height: 40.h,
                      ),
                      TextWithFont().textShow(
                          color:
                              Theme.of(context).textTheme.headlineLarge!.color!,
                          fontSize: 14.sp,
                          text: 'Edit Your Review',
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: 8.h,
                      ),
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: titleController,
                          minLines: 6,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(
                                10.0, 10.0, 10.0, 10.0),
                            fillColor: Get.isDarkMode
                                ? Theme.of(context).cardColor
                                : authTextFromFieldFillColor.withOpacity(.3),
                            hintText: 'Edit your review here',
                            hintStyle: TextStyle(
                              color: authTextFromFieldHintTextColor,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: authTextFromFieldPonderColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: authTextFromFieldPonderColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * .1,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                String title = titleController.text.trim();
                                await reviewController.editReviewProduct(
                                    ratingData:
                                        reviewController.ratingUserEdit!,
                                    rate: reviewController.rating,
                                    title: title);
                                reviewController.showProductReviews(
                                  reviewController.idProduct.toString(),
                                  // reviewController.rating.toInt(),
                                );

                                Get.offNamed(ScreenName.allReviewScreen,
                                    arguments: {
                                      'mealID': reviewController.idProduct
                                    });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.white,
                              side: BorderSide.none,
                              // primary:,
                              minimumSize: Size(220.w, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: TextWithFont().textShow(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              text: 'Save',
                            )),
                      )
                    ],
                  );
          }),
        ),
      ),
    );
  }
}
