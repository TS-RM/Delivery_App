import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class CardRev extends StatelessWidget {
  const CardRev({
    Key? key,
    required this.data,
  }) : super(key: key);
  final MealModel data;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: ClipOval(
                    child: data.userId != null
                        ? CachedNetworkImage(
                            imageUrl: ' data.user!.image!',
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/images/icons/person.png',
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                            ),
                            width: 100,
                            height: 100,
                            fit: BoxFit.fill,
                          )
                        : Image.asset(
                            'assets/images/icons/person.png',
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                          ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    data.userId != null
                        ? TextWithFont().textShow(
                            color: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .color,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal,
                            text: 'data.user!.firstName!')
                        : TextWithFont().textShow(
                            color: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .color,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal,
                            text: 'unknown'),
                    RatingBar.builder(
                      initialRating: 3, // data.rate!.toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20.0,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Color.fromRGBO(245, 201, 99, 1),
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                '   data.feedback!',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .color!
                        .withOpacity(.6)),
                maxLines: 3,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextWithFont().textShow(
                  color: Theme.of(context).textTheme.headlineLarge!.color!,
                  fontSize: 16.sp,
                  text: 'data.createdAt!.substring(0, 10)',
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
