import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/enums/loading_state.dart';
import 'package:tashil_food_app/constants/enums/loading_types.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';
import 'package:tashil_food_app/data/services/search_services.dart';

class SearchController extends GetxController {
  // var searchRestaurantList = <DataRestaurant>[].obs;

  // var searchProductsList = <DataProducts>[].obs;
  var searchMealList = <MealModel>[].obs;

  int _pageNo = 1;
  final scrollControllerRestaurant = ScrollController();
  final scrollControllerProducts = ScrollController();

  final loadingStateRestaurant =
      LoadingState(loadingType: LoadingType.stable).obs;
  final loadingStateProducts =
      LoadingState(loadingType: LoadingType.stable).obs;

  var textFormFild = ''.obs;
  // var searchProductsLoding=false.obs;
  @override
  void onInit() async {
    // scrollControllerRestaurant.addListener(_scrollListenerRestaurant);
    // scrollControllerProducts.addListener(_scrollListenerProducts);
  }

  // void _scrollListenerRestaurant() async {
  //   if (scrollControllerRestaurant.offset >=
  //           scrollControllerRestaurant.position.maxScrollExtent &&
  //       !scrollControllerRestaurant.position.outOfRange) {
  //     loadingStateRestaurant.value =
  //         LoadingState(loadingType: LoadingType.loading);
  //     try {
  //       await Future.delayed(Duration(seconds: 5));
  //       final listOfData = await SearchServices.viewRestaurantsSearch(
  //           _pageNo, textFormFild.value);

  //       if (searchRestaurantList.isEmpty) {
  //         loadingStateRestaurant.value = LoadingState(
  //             loadingType: LoadingType.completed,
  //             completed: "there is no data");
  //       } else {
  //         searchRestaurantList.addAll(listOfData as Iterable<DataRestaurant>);
  //         loadingStateRestaurant.value =
  //             LoadingState(loadingType: LoadingType.loaded);
  //       }
  //     } catch (err) {
  //       loadingStateRestaurant.value =
  //           LoadingState(loadingType: LoadingType.error, error: err.toString());
  //     }
  //   }
  // }

  // void _scrollListenerProducts() async {
  //   // searchProductsLoding.value=true;

  //   if (scrollControllerProducts.offset >=
  //           scrollControllerProducts.position.maxScrollExtent &&
  //       !scrollControllerProducts.position.outOfRange) {
  //     loadingStateProducts.value =
  //         LoadingState(loadingType: LoadingType.loading);
  //     try {
  //       await Future.delayed(Duration(seconds: 5));

  //       final listOfData =
  //           await SearchServices.viewFoodsSearch(_pageNo, textFormFild.value);

  //       // if (searchProductsList.isEmpty) {
  //       //   loadingStateProducts.value = LoadingState(
  //       //       loadingType: LoadingType.completed,
  //       //       completed: "there is no data");
  //       // } else {
  //       //   searchProductsList.addAll(listOfData as Iterable<DataProducts>);
  //       //   loadingStateProducts.value =
  //       //       LoadingState(loadingType: LoadingType.loaded);
  //       // }
  //     } catch (err) {
  //       loadingStateProducts.value =
  //           LoadingState(loadingType: LoadingType.error, error: err.toString());
  //     }
  //   }
  //   // searchProductsLoding.value=false;
  // }

  // void viewSearchRestaurants(String searchVal) async {
  //   final listOfData =
  //       await SearchServices.viewRestaurantsSearch(_pageNo, searchVal);
  //   searchRestaurantList.assignAll(listOfData as Iterable<DataRestaurant>);
  //   // isLoadingRestaurants.value = false;
  // }

  void viewSearchProducts(String searchVal) async {
    final response = await SearchServices.viewMealsSearch(searchVal);
    if (response != null) {
      final listOfData =
          (response as List).map((e) => MealModel.fromJson(e)).toList();
      searchMealList.assignAll(listOfData);
    }

    // isLoadingRestaurants.value = false;
  }
}
