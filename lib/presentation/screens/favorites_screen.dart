import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/core/logic/controllers/favorites_conntroller.dart';
import 'package:tashil_food_app/presentation/widgets/auth/check_session_user.dart';

import '../widgets/favorite/app_bar_favorites.dart';
import '../widgets/favorite/item_list_view.dart';

class FavoritesScreen extends GetView<FavoritesController> {
  const FavoritesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarFavorites(),
      body: CheckSessionUser(
        child: Obx(
          () => controller.favoritesList.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.favoritesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemListView(
                        mealModel: controller.favoritesList[index],
                      );
                    },
                  ),
                )
              : Center(
                  child: Text(
                    "No Favorite Foods".tr,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .color!
                          .withOpacity(.5),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
