import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';

class LeadingListTile extends StatelessWidget {
  const LeadingListTile({
    Key? key,
    required this.mealModel,
  }) : super(key: key);
  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 35,
                child: ClipOval(
                  // borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(
                      Icons.photo_rounded,
                      color: Colors.grey.shade700,
                      size: 100,
                    ),
                    height: 90.0.h,
                    width: 90.w,
                    fit: BoxFit.cover,
                    imageUrl: mealModel.image.toString(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            mealModel.name.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .color,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: 30.w,
                        // ),
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: Icon(
                        //     Icons.favorite,
                        //     color: mainColor,
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 140,
                          child: Text(
                            mealModel.category.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .color,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40.w,
                        ),
                        Text(
                          '${mealModel.price}\$',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Image.asset(
                            'assets/images/fir.png',
                            alignment: Alignment.topCenter,
                            width: 16,
                            height: 16,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text('${mealModel.calories} ${'Kcal'.tr}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .color,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
