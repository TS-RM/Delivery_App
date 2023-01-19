import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/review_product_controllers.dart';

class ReviewRating extends StatelessWidget {
  final reviewProductController = Get.find<PreviewProductController>();

  ReviewRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              reviewProductController.currentSelected.value = index;
              reviewProductController.showProductReviews(
                  reviewProductController.idProduct.toString(),
                  reviewProductController.sizeList[index]);
              // print('index $index');
            },
            child: Obx(
              () => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? reviewProductController.currentSelected.value == index
                          ? mainColor
                          : Colors.black
                      : reviewProductController.currentSelected.value == index
                          ? mainColor
                          : Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: mainColor.withOpacity(0.4),
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      reviewProductController.sizeList[index].toString(),
                      style: TextStyle(
                          color: Get.isDarkMode
                              ? reviewProductController.currentSelected.value ==
                                      index
                                  ? Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .color
                                  : Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .color
                              : reviewProductController.currentSelected.value ==
                                      index
                                  ? Colors.white
                                  : Colors.black.withOpacity(.3),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    const Icon(
                      Icons.star,
                      color: Color.fromRGBO(245, 201, 99, 1),
                      size: 18,
                    )
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: reviewProductController.sizeList.length,
      ),
    );
  }
}
