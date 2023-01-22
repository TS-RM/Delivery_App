import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tashil_food_app/constants/init/init_boxses.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
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
        child: controller.isLoading
            ? Center(
                child: CircularProgressIndicator(
                color: mainColor,
              ))
            : ValueListenableBuilder(
                valueListenable: Boxes.getFavoritesData().listenable(),
                builder: (context, favoritesData, child) {
                  if (favoritesData.isNotEmpty) {
                    final favorites = favoritesData.values.toList();
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: favorites.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemListView(
                            favoritesHiveModel: favorites[index],
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
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
                    );
                  }
                },
              ),
      ),
    );
  }
}
