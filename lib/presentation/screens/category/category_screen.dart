import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/core/logic/controllers/resturant_controller.dart';
import 'package:tashil_food_app/core/helper/handling_data_view.dart';
import 'package:tashil_food_app/data/category/model/category_model.dart';

import 'package:tashil_food_app/routes/screen_name.dart';

import '../../widgets/category/appbar_category.dart';

class CategoryScreen extends GetView<RestaurantController> {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCategory(),
      body: Obx(() {
        return SingleChildScrollView(
          child: HandlingDataView(
            statusRequest: controller.statusRequestCategory,
            widget: Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 10),
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.allCategoriesList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1),
                  itemBuilder: (context, index) {
                    return categoryCard(controller.allCategoriesList[index]);
                  }),
            ),
          ),
        );
      }),
    );
  }

  categoryCard(CategoryModel categoryModel) {
    return GestureDetector(
      onTap: (() {
        Get.toNamed(ScreenName.resturantScreen, arguments: [
          {
            "id": categoryModel.id.toString(),
            "name": categoryModel.name.toString(),
          }
        ]);
      }),
      child: Container(
        margin: const EdgeInsets.all(5),
        width: 110,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
            image: CachedNetworkImageProvider(
              categoryModel.logo!,
            ),
            // (
            //   homeRestaurantsData.logo!,
            // ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Text(
            categoryModel.name!,
            maxLines: 1,
            style: TextStyle(
              color: Colors.white.withOpacity(0.95),
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
