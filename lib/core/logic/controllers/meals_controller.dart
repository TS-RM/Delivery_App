import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/enums/loading_state.dart';
import 'package:tashil_food_app/constants/enums/loading_types.dart';
import 'package:tashil_food_app/data/category/model/category_model.dart';
import 'package:tashil_food_app/data/category/service/category_hive_service.dart';
import 'package:tashil_food_app/data/firebase/crud_firebase.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';
import 'package:tashil_food_app/constants/enums/status_request.dart';
import 'package:tashil_food_app/data/meals/service/meal_service.dart';
import 'package:tashil_food_app/presentation/widgets/get_snackbar.dart';

class MealsController extends GetxController {
  var allMeals = <MealModel>[].obs;
  var allCategoriesList = <CategoryModel>[].obs;

  RxBool isLoading = false.obs;
  void startLoading() {
    isLoading.value = true;
    // isLoading.refresh();
  }

  void stopLoading() {
    isLoading.value = false;
    // isLoading.refresh();
  }

  final scrollController = ScrollController();
  int _limit = 6;
  final loadingState = LoadingState(loadingType: LoadingType.stable).obs;
  late StatusRequest statusRequestFood;
  var currentSelected = 0.obs;
  var currentSelectedRating = 0.obs;
  var currentSelectedSlider = 0.0.obs;
  Rx<RangeValues> values = const RangeValues(0, 500.00).obs;
  RxString startLabel = 0.toString().obs;
  RxString endLabel = 500.00.toString().obs;

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
    await viewAllMeals();
    await viewCategories();
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
          // allMeals.refresh();
          loadingState.value = LoadingState(loadingType: LoadingType.loaded);
        }
      } catch (err) {
        loadingState.value =
            LoadingState(loadingType: LoadingType.error, error: err.toString());
      }
    }
  }

  Future<void> viewAllMeals() async {
    startLoading();
    var response = await MealService.viewAllMeals(_limit);
    if (response != null) {
      final dataList =
          (response as List).map((e) => MealModel.fromJson(e)).toList();
      allMeals.addAll(dataList);
      allMeals.refresh();
    }
    stopLoading();
    update();
  }

  viewCategories() async {
    final CategoryHiveService localCategory = CategoryHiveService();
    final dataCategory = localCategory.getAllCategory();
    if (dataCategory != null) {
      allCategoriesList.addAll(dataCategory);
    }
    update();
  }

  filterProduct(
      {required String category,
      required int price,
      required int rating,
      required RangeValues ratingValue,
      required String subcategory}) async {
    Get.back();
    startLoading();
    final response = await CrudFirebase().getFilterMeals(
        tableName: 'Meals',
        fieldName: 'category',
        value: category,
        fieldName1: 'price',
        greaterValue: ratingValue.end.toInt(),
        smallerValue: ratingValue.start.toInt());
    if (response != null) {
      final dataList = response.map((e) => MealModel.fromJson(e)).toList();
      print(dataList);
      allMeals.clear();
      allMeals.addAll(dataList);
      allMeals.refresh();
      stopLoading();
    } else {
      allMeals.clear();
      stopLoading();
    }
    update();
  }

  @override
  void onClose() {
    allMeals.clear();
    allMeals.refresh();
    super.onClose();
  }
}
