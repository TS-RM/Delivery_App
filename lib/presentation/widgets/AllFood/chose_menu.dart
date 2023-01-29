import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/meals_controller.dart';

class ChoseMenu extends StatelessWidget {
  ChoseMenu({
    Key? key,
  }) : super(key: key);
  final mealsController = Get.find<MealsController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              mealsController.currentSelected.value = index;
            },
            child: Obx(
              () => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: mealsController.currentSelected.value == index
                      ? mainColor
                      : Theme.of(context).textTheme.headlineMedium!.color,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: mainColor.withOpacity(0.4),
                    width: 2,
                  ),
                ),
                child: Text(
                  mealsController.allCategoriesList[index].name!,
                  style: TextStyle(
                    color: mealsController.currentSelected.value == index
                        ? Colors.white
                        : Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .color!
                            .withOpacity(.5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: mealsController.allCategoriesList.length,
      ),
    );
  }
}
