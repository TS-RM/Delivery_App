import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class CardRes extends StatelessWidget {
  const CardRes({
    Key? key,
    required this.mealModel,
  }) : super(key: key);
  final MealModel mealModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      elevation: 5,
      borderOnForeground: true,
      // shadowColor: Colors.grey.withOpacity(.3),
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        leading: ClipOval(
          child: SizedBox.fromSize(
            size: const Size.fromRadius(20), // Image radius
            child: CachedNetworkImage(
              imageUrl: mealModel.image!,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(
            mealModel.name!,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.headlineLarge!.color!,
            ),
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Image.asset(
                    'assets/images/fire.png',
                    width: 20,
                    height: 14,
                  ),
                ),
                Text('${mealModel.rating}',
                    style: TextStyle(
                        fontSize: 12,
                        color:
                            Theme.of(context).textTheme.headlineLarge!.color)),
                Text(
                  "Kcal".tr,
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).textTheme.headlineLarge!.color),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 3.5),
                  child: RatingBarIndicator(
                    rating: 3.6,
                    itemCount: 1,
                    itemSize: 15.0,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: mainColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  '${mealModel.rating}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            TextWithFont().textShow(
                color: mainColor,
                fontSize: 16.sp,
                text: '${mealModel.price}\$',
                fontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}
