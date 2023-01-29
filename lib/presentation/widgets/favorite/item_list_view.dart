import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/favorites_conntroller.dart';
import 'package:tashil_food_app/data/favorites/model/favorites_hive_model.dart';
import 'package:tashil_food_app/presentation/widgets/favorite/loading_list_tile.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

class ItemListView extends GetView<FavoritesController> {
  const ItemListView({
    Key? key,
    required this.favoritesHiveModel,
  }) : super(key: key);
  final FavoritesHiveModel favoritesHiveModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      child: Card(
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // <-- Radius
        ),
        child: ListTile(
          // trailing: TrailingListTile(),
          title: LeadingListTile(
            mealModel: favoritesHiveModel.mealModel!,
          ),
          subtitle: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(
                    ScreenName.productDetailsScreen,
                    arguments: [
                      {'MealData': favoritesHiveModel.mealModel}
                    ],
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  minimumSize: Size(120.w, 30.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // <-- Radius
                  ),
                ),
                child: Text(
                  'Order'.tr,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 70.w),
              ElevatedButton(
                onPressed: () {
                  controller.deleteFavorites(favoritesHiveModel.id.toString());
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  backgroundColor: Get.isDarkMode
                      ? const Color(0xFF18172B)
                      : darkGreyClr.withOpacity(0.8),
                  minimumSize: Size(120.w, 30.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // <-- Radius
                  ),
                ),
                child: Text(
                  'Delete'.tr,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
