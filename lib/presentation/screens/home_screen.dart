import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/home_controllers.dart';
import 'package:tashil_food_app/core/logic/controllers/onboarding_home_controller.dart';
import 'package:tashil_food_app/core/helper/handling_data_view.dart';
import 'package:tashil_food_app/presentation/widgets/home/category_card.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

import '../widgets/home/appbar_Item.dart';
import '../widgets/home/custom_row_home_page.dart';
import '../widgets/home/meals_view.dart';
import '../widgets/home/onbording_item.dart';
import '../widgets/onboarding/onboarding_indicator_home.dart';

// TODO  // edit

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.find<OnBoardingHomeController>();
  final homeController = Get.find<HomeController>();
  Future<void> _refreshLocalGallery() async {
    homeController.homeMealsList.value = [];
    homeController.homeOfferList.value = [];
    homeController.homeCategoryList.value = [];

    homeController.viewHomeCategory();
    homeController.viewStaticHomeOffer();
    homeController.getDataMealsHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: _refreshLocalGallery,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarItem(),
              SizedBox(
                height: 12.h,
              ),
              GetBuilder<HomeController>(builder: (_) {
                return HandlingDataView(
                  statusRequest: homeController.statusRequestOffer,
                  widget: offerShow(),
                );
              }),
              SizedBox(height: 13.h),
              OnBoardingIndicatorHome(
                margin: 3.w,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomRowHomePage(
                firstText: 'Categorys'.tr,
                scendText: 'See All'.tr,
                press: () {
                  Get.toNamed(ScreenName.categoryScreen);
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              GetBuilder<HomeController>(builder: (_) {
                return HandlingDataView(
                  statusRequest: homeController.statusRequestCategory,
                  widget: categoryShow(),
                );
              }),
              SizedBox(
                height: 10.h,
              ),
              CustomRowHomePage(
                  firstText: 'Most Popular'.tr,
                  scendText: 'See All'.tr,
                  press: () {
                    Get.toNamed(ScreenName.allFoodScreen);
                  }),
              SizedBox(
                height: 10.h,
              ),
              GetBuilder<HomeController>(builder: (_) {
                return HandlingDataView(
                  statusRequest: homeController.statusRequestMeals,
                  widget: mealsShow(),
                );
              }),
              CustomRowHomePage(
                  firstText: 'New Foods'.tr,
                  scendText: 'See All'.tr,
                  press: () {
                    Get.toNamed(ScreenName.allFoodScreen);
                  }),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              GetBuilder<HomeController>(builder: (_) {
                return HandlingDataView(
                  statusRequest: homeController.statusRequestMeals,
                  widget: mealsShow(),
                );
              })
            ],
          ),
        ),
      ),
    ));
  }

  Widget offerShow() {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 380,
        height: 170,
        child: PageView.builder(
          controller: controller.pageController,
          onPageChanged: (value) {
            controller.onPageChanged(value);
          },
          itemCount: homeController.homeOfferList.length,
          itemBuilder: (context, i) => GestureDetector(
            onTap: () {
              // Get.toNamed(
              //   ScreenName.productDetailsScreen,
              //   arguments: [
              //     {'prodectData': homeController.homeOfferList[i].mealID}
              //   ],
              // );
            },
            child: OnBoardingItem(
              offerModel: homeController.homeOfferList[i],
            ),
          ),
        ),
      ),
    );
  }

  Widget mealsShow() {
    return Container(
      height: 250,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 10),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: homeController.homeMealsList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(
                  ScreenName.productDetailsScreen,
                  arguments: [
                    {'MealData': homeController.homeMealsList[index]}
                  ],
                );
              },
              child: FoodsView(
                homeProductData: homeController.homeMealsList[index],
              ),
            );
          }),
    );
  }

  Widget categoryShow() {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: homeController.homeCategoryList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(ScreenName.resturantScreen, arguments: [
                  {
                    "id": homeController.homeCategoryList[index].id.toString(),
                    "name":
                        homeController.homeCategoryList[index].name.toString(),
                  }
                ]);
              },
              child: CategoryCard(
                categoryModel: homeController.homeCategoryList[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
