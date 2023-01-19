import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/resturant_controller.dart';

class ChoseMenu extends GetView<RestaurantController> {
  const ChoseMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Obx(
          () => ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.currentSelected.value = index;
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: controller.currentSelected.value == index
                        ? mainColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: mainColor.withOpacity(0.4),
                      width: 2,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.currentSelected.value = index;
                      print(index);
                    },
                    child: Text(
                      controller.allCategoriesList[index].name.toString(),
                      style: TextStyle(
                        color: controller.currentSelected.value == index
                            ? Colors.white
                            : Colors.black.withOpacity(.3),
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
            itemCount: controller.allCategoriesList.length,
          ),
        ));
  }
}
