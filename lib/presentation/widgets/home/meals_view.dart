import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';

class FoodsView extends StatelessWidget {
  const FoodsView({Key? key, required this.homeProductData}) : super(key: key);
  final MealModel homeProductData;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
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
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Expanded(
          //   child: Container(
          //     margin: const EdgeInsets.all(0),
          //     decoration: BoxDecoration(
          //       borderRadius: const BorderRadius.vertical(
          //           top: Radius.circular(10), bottom: Radius.zero),
          //       color: Colors.grey.shade300,
          //       image: DecorationImage(
          //         image: CachedNetworkImageProvider(
          //           homeProductData.image!,
          //         ),
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //     // ),
          //   ),
          // ),
          Container(
            height: 215,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.overlay),
                image: CachedNetworkImageProvider(
                  homeProductData.image!,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 120),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: const BorderRadius.vertical(
                    top: Radius.zero, bottom: Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      homeProductData.name!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: authTextFromFieldFillColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$ ${homeProductData.price}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: authTextFromFieldFillColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            RatingBarIndicator(
                              rating: homeProductData.rating!.toDouble(),
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
                              style: const TextStyle(
                                color: authTextFromFieldFillColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]));
  }
}
