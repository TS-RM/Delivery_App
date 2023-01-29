import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/data/category/model/category_model.dart';
import 'package:tashil_food_app/data/category/service/category_hive_service.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';
import 'package:tashil_food_app/core/helper/handing_data_controller.dart';
import 'package:tashil_food_app/constants/enums/status_request.dart';
import 'package:tashil_food_app/data/home/service/home_services.dart';
import 'package:tashil_food_app/data/offer/model/model_offer.dart';

class HomeController extends GetxController {
  var homeCategoryList = <CategoryModel>[].obs;
  var homeMealsList = <MealModel>[].obs;

  var homeOfferList = <OfferModel>[].obs;
  var storage = SharedPref.instance;
  late StatusRequest statusRequestCategory;
  late StatusRequest statusRequestMeals;
  late StatusRequest statusRequestOffer;

  @override
  void onInit() async {
    viewHomeOffer();

    // firebase
    viewHomeCategory();
    getDataMealsHome();
    super.onInit();
    // addProduct();
  }

  void viewHomeCategory() async {
    statusRequestCategory = StatusRequest.loading;
    var response = await HomeServices.viewHomeCategory();
    statusRequestCategory = handlingData(response);
    if (StatusRequest.success == statusRequestCategory) {
      if (response != null) {
        final dataList =
            (response as List).map((e) => CategoryModel.fromJson(e)).toList();
        homeCategoryList.addAll(dataList);
        await CategoryHiveService().addListCategory(dataCategory: dataList);
      } else {
        statusRequestCategory = StatusRequest.failure;
      }
    }
    update();
  }

  void addProduct() async {
    final doc = FirebaseFirestore.instance.collection('Meals').doc();
    MealModel productModel = MealModel()
      ..id = doc.id
      ..name = 'كبسة مندي'
      ..description =
          'simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'
      ..addedDate = DateTime.now()
      ..calories = 20
      ..category = ''
      ..image =
          'https://firebasestorage.googleapis.com/v0/b/mashwy-ed141.appspot.com/o/productImg%2F3.webp?alt=media'
      ..option = ''
      ..price = 500
      ..rating = 3.5
      ..status = 1
      ..userId = '';
    final data = productModel.toJson();
    await doc.set(data);
  }

  void getDataMealsHome() async {
    statusRequestMeals = StatusRequest.loading;
    var response = await HomeServices.viewHomeMeals();
    statusRequestMeals = handlingData(response);
    if (StatusRequest.success == statusRequestMeals) {
      if (response != null) {
        final dataList =
            (response as List).map((e) => MealModel.fromJson(e)).toList();
        homeMealsList.addAll(dataList);
      } else {
        statusRequestMeals = StatusRequest.failure;
      }
    }

    update();
  }

  Future<void> viewHomeOffer() async {
    statusRequestOffer = StatusRequest.loading;
    var response = await HomeServices.viewHomeOffers();
    statusRequestOffer = handlingData(response);
    if (StatusRequest.success == statusRequestOffer) {
      if (response != null) {
        final dataList =
            (response as List).map((e) => OfferModel.fromJson(e)).toList();
        homeOfferList.addAll(dataList);
      } else {
        statusRequestOffer = StatusRequest.failure;
      }
    }
    update();
  }
}
