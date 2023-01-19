import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';

class FavoritesController extends GetxController {
  // var favoritesList = <HomeProductData>[].obs;
  var favoritesList = <MealModel>[].obs;
  var storage = SharedPref.instance;
  String favoritesListString = '';

  @override
  void onInit() async {
    favoritesListString = storage.getString('favoritesList') ?? '';
    if (favoritesListString != '') {
      final List<MealModel> favoriteList =
          MealModel.decode(favoritesListString);
      if (kDebugMode) {
        print(favoriteList.length);
      }

      favoritesList.value = favoriteList;
    }
    super.onInit();
  }

  void mangeFavorites(
    MealModel mealModel,
  ) async {
    var index =
        favoritesList.indexWhere((element) => element.id == mealModel.id);
    if (index >= 0) {
      favoritesList.removeAt(index);
      await storage.remove(
        'favoritesList',
      );
    } else {
      favoritesList.addIf(!favoritesList.contains(mealModel), mealModel);

      final String encodedData = MealModel.encode(favoritesList);
      await storage.setString('favoritesList', encodedData);
    }
  }

  bool isFavorites(MealModel mealModel, String id) {
    bool isFavorite = false;

    for (int i = 0; i < favoritesList.length; i++) {
      if (favoritesList[i].id == id) {
        isFavorite = true;
        break;
      }
    }

    return isFavorite;
  }
}
