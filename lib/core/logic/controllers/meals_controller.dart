import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/enums/loading_state.dart';
import 'package:tashil_food_app/constants/enums/loading_types.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';
import 'package:tashil_food_app/constants/enums/status_request.dart';
import 'package:tashil_food_app/data/home/service/home_services.dart';
import 'package:tashil_food_app/data/meals/service/meal_service.dart';

import '../../../data/model/all_categories.dart';

class MealsController extends GetxController {
  // var allFoodsList = <HomeProductData>[].obs;
  var allMeals = <MealModel>[].obs;
  var allCategoriesList = <Data>[].obs;

  final isLoading = true.obs;
  final scrollController = ScrollController();
  int _limit = 6;
  final loadingState = LoadingState(loadingType: LoadingType.stable).obs;
  late StatusRequest statusRequestFood;
  var currentSelected = 0.obs;
  var currentSelectedRating = 0.obs;
  var currentSelectedSlider = 0.0.obs;
  Rx<RangeValues> values = const RangeValues(0, 100.00).obs;
  RxString startLabel = 0.toString().obs;
  RxString endLabel = 100.00.toString().obs;

  final List sizeList = [
    1,
    2,
    3,
    4,
    5,
  ].obs;

  @override
  void onInit() async {
    super.onInit();
    // await viewAllFood();
    await viewAllMeals();
    // await viewCategories();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      print('donw');
      loadingState.value = LoadingState(loadingType: LoadingType.loading);
      try {
        await Future.delayed(const Duration(seconds: 5));

        final listOfData = await MealService.viewAllMeals(++_limit);

        if (listOfData.isEmpty) {
          loadingState.value = LoadingState(
              loadingType: LoadingType.completed,
              completed: "there is no data");
        } else {
          final dataList =
              (listOfData as List).map((e) => MealModel.fromJson(e)).toList();
          allMeals.clear();
          allMeals.addAll(dataList);
          loadingState.value = LoadingState(loadingType: LoadingType.loaded);
        }
      } catch (err) {
        loadingState.value =
            LoadingState(loadingType: LoadingType.error, error: err.toString());
      }
    }
  }

  Future<void> viewAllMe() async {
    // final listOfData = await FoodApi.viewAllFoods(
    //   _pageNo,
    // );
    // allFoodsList.assignAll(listOfData);
    isLoading.value = false;
  }

  Future<void> viewAllMeals() async {
    var response = await MealService.viewAllMeals(_limit);
    if (response != null) {
      final dataList =
          (response as List).map((e) => MealModel.fromJson(e)).toList();
      allMeals.addAll(dataList);
    }
    isLoading.value = false;
  }

  viewCategories() async {
    // var response = await FoodApi.viewAllCategories();

    // if (response['status'] == 200) {
    //   final dataList =
    //       (response['data'] as List).map((e) => Data.fromJson(e)).toList();
    //   print(dataList);
    //   allCategoriesList.addAll(dataList);
    // }

    update();
  }

  filterProduct(
      {required String category,
      required int price,
      required int rating,
      required String subcategory}) async {
    // var response = await FoodApi.filterProdect(
    //     category: category,
    //     price: price,
    //     rating: rating,
    //     subcategory: subcategory);

    // if (response['status'] == 200) {
    //   final dataList =
    //       (response['data'] as List).map((e) => Data.fromJson(e)).toList();
    //   print(dataList);
    //   allCategoriesList.assignAll(dataList);
    // }

    update();
  }
}
