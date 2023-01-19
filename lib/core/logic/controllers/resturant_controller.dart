import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/enums/loading_state.dart';
import 'package:tashil_food_app/constants/enums/loading_types.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';
import 'package:tashil_food_app/data/category/model/category_model.dart';

import 'package:tashil_food_app/core/helper/handing_data_controller.dart';
import 'package:tashil_food_app/constants/enums/status_request.dart';
import 'package:tashil_food_app/data/home/service/home_services.dart';

class RestaurantController extends GetxController {
  // var allRestaurantsList = <DataOfRestaurant>[].obs;
  var mealModel = <MealModel>[].obs;

  // var allRestaurantsListWithOutPage = <DataOfRestaurant>[].obs;
  var allCategoriesList = <CategoryModel>[].obs;
  final scrollController = ScrollController();
  final loadingState = LoadingState(loadingType: LoadingType.stable).obs;

  var currentSelected = 0.obs;

  late StatusRequest statusRequestCategory;
  // late StatusRequest statusRequestRestaurantWithOutPage;

  @override
  void onInit() async {
    viewAllCategory();
    // viewRestaurantsWithOutPag();
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  void _scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      loadingState.value = LoadingState(loadingType: LoadingType.loading);
      try {
        await Future.delayed(const Duration(seconds: 5));

        // var response = await RestaurantApi.viewAllRestaurants(++_pageNo);

        if (mealModel.isEmpty) {
          loadingState.value = LoadingState(
              loadingType: LoadingType.completed,
              completed: "there is no data");
        } else {
          // final dataList = (response['data']['restaurants']['data'] as List)
          //     .map((e) => DataOfRestaurant.fromJson(e))
          //     .toList();
          // mealModel.addAll(dataList);
          loadingState.value = LoadingState(loadingType: LoadingType.loaded);
        }
      } catch (err) {
        loadingState.value =
            LoadingState(loadingType: LoadingType.error, error: err.toString());
      }
    }
  }

  void viewAllCategory() async {
    statusRequestCategory = StatusRequest.loading;
    var response = await HomeServices.viewHomeCategory();
    statusRequestCategory = handlingData(response);
    if (StatusRequest.success == statusRequestCategory) {
      if (response != null) {
        final dataList =
            (response as List).map((e) => CategoryModel.fromJson(e)).toList();
        allCategoriesList.assignAll(dataList);
      } else {
        statusRequestCategory = StatusRequest.failure;
      }
    }
    update();
  }

  void viewMealsForCategory(String value) async {
    statusRequestCategory = StatusRequest.loading;
    var response = await HomeServices.viewMealsForCategory(value);
    statusRequestCategory = handlingData(response);
    if (StatusRequest.success == statusRequestCategory) {
      if (response != null) {
        final dataList =
            (response as List).map((e) => MealModel.fromJson(e)).toList();
        mealModel.assignAll(dataList);
      } else {
        statusRequestCategory = StatusRequest.failure;
      }
    }
    update();
  }

  // void viewRestaurantsWithOutPag() async {
  //   statusRequestRestaurantWithOutPage = StatusRequest.loading;
  //   // var response = await RestaurantApi.viewRestaurantsWithOutPage();
  //   statusRequestRestaurantWithOutPage = handlingData(response);
  //   if (StatusRequest.success == statusRequestRestaurantWithOutPage) {
  //     if (response['status'] == 200) {
  //       // final dataList = (response['data']['restaurants']['data'] as List)
  //       //     .map((e) => DataOfRestaurant.fromJson(e))
  //       //     .toList();
  //       // allRestaurantsListWithOutPage.assignAll(dataList);
  //     } else {
  //       statusRequestRestaurantWithOutPage = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }
}
