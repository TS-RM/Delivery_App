import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class MealCard extends StatelessWidget {
  const MealCard({Key? key, required this.homeProductData}) : super(key: key);
  final MealModel homeProductData;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).textTheme.headlineSmall!.color,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 2,
              color: Color.fromARGB(76, 0, 0, 0),
            )
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10), bottom: Radius.zero),
                color: Colors.grey.shade300,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    homeProductData.image!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              // ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  homeProductData.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headlineLarge!.color,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '\$ ${homeProductData.price}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.headlineLarge!.color,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        RatingBarIndicator(
                          rating: homeProductData.rating!,
                          itemCount: 1,
                          itemSize: 16.0,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: mainColor,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          '${homeProductData.rating}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .color,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150.w,
                      height: 45.h,
                      child: // TextWithFont().textShow(
                        Text(
                          homeProductData.description!,
                          maxLines: 2,
                          style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .color!
                              .withOpacity(.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                        ),
                        ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ]));
  }
}
