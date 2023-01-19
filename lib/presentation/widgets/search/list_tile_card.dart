import 'package:flutter/material.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';

class ListTileCard extends StatelessWidget {
  const ListTileCard({
    Key? key,
    required this.subtitleWidget,
    // required this.dataRestaurant,
    required this.dataMeals,
    required this.isProduct,
  }) : super(key: key);
  final Widget subtitleWidget;
  // final DataRestaurant dataRestaurant;
  final MealModel dataMeals;
  final bool isProduct;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          isProduct ? '${dataMeals.name}' : '${dataMeals.name}',
          style: TextStyle(
              //                    fontSize: 15,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).textTheme.headlineLarge!.color),
        ),
        leading: CircleAvatar(
          radius: 25.0,
          backgroundImage: NetworkImage(
            isProduct ? '${dataMeals.image}' : '${dataMeals.name}',
          ),
        ),
        trailing: SizedBox(
          width: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.star,
                color: mainColor,
                size: 20,
              ),
              Text(
                isProduct ? '${dataMeals.rating}' : '${dataMeals.rating}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .color!
                      .withOpacity(.5),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        subtitle: subtitleWidget,
      ),
    );
  }
}
