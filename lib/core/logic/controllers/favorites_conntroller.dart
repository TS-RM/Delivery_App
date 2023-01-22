import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/data/category/model/category_model.dart';
import 'package:tashil_food_app/data/favorites/model/favorites_hive_model.dart';
import 'package:tashil_food_app/data/favorites/model/favorites_model.dart';
import 'package:tashil_food_app/data/favorites/service/favorites_service.dart';
import 'package:tashil_food_app/data/favorites/service/favorites_service_hive.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';
import 'package:tashil_food_app/data/meals/service/meal_service.dart';

class FavoritesController extends GetxController {
  // var favoritesList = <HomeProductData>[].obs;
  var favoritesList = <MealModel>[].obs;
  var storage = SharedPref.instance;
  String favoritesListString = '';

  bool isLoading = false;

  void startLoading() {
    isLoading = true;
    update();
  }

  void stopLoading() {
    isLoading = false;
    update();
  }

  @override
  void onInit() async {
    getAllFavorites();
    // favoritesListString = storage.getString('favoritesList') ?? '';
    // if (favoritesListString != '') {
    //   final List<MealModel> favoriteList =
    //       MealModel.decode(favoritesListString);
    //   if (kDebugMode) {
    //     print(favoriteList.length);
    //   }

    //   favoritesList.value = favoriteList;
    // }
    super.onInit();
  }

  getAllFavorites() async {
    String id = storage.getString('id') ?? '';
    if (id != '') {
      final dataReturn = await FavoritesService().getAllFavorites(id);
      if (dataReturn != null) {
        for (var element in dataReturn) {
          final dataMeal = await getMealInFavorites(element.mealID.toString());
          if (dataMeal != null) {
            FavoritesHiveModel favoritesHiveModel = FavoritesHiveModel()
              ..id = element.id
              ..mealModel = dataMeal
              ..userID = element.userID;
            FavoritesHiveService()
                .addFavoritesData(favoritesHiveModel: favoritesHiveModel);
          }
        }
      }
    }
  }

  Future<MealModel?> getMealInFavorites(String id) async {
    final data = await MealService().getMealWhereID(idMeal: id);
    final dataAddCategory = getCategory(data);
    if (dataAddCategory != null) {
      return dataAddCategory;
    } else {
      return null;
    }
  }

  MealModel? getCategory(MealModel mealModel) {
    final data = storage.getString('homeCategoryList');
    final encodedData = CategoryModel.decode(data.toString());
    final index =
        encodedData.indexWhere((element) => element.id == mealModel.category);
    if (index >= 0) {
      mealModel.category = encodedData[index].name.toString();
      return mealModel;
    } else {
      return null;
    }
  }

  addFavorites({
    required MealModel mealModel,
  }) async {
    String id = storage.getString('id') ?? '';
    if (id != '') {
      final dataReturn = FavoritesHiveService().getAll();
      if (dataReturn != null) {
        var index = dataReturn
            .indexWhere((element) => element.mealModel!.id == mealModel.id);
        if (index >= 0) {
          final favoriteData = dataReturn[index];
          deleteFavorites(favoriteData.id.toString());
        } else {
          FavoritesModel favoritesModel = FavoritesModel()
            ..mealID = mealModel.id
            ..userID = id;
          final data = await FavoritesService()
              .addToFavorites(favoritesModel: favoritesModel);
          final dataAddCategory = getCategory(mealModel);
          if (data != null && dataAddCategory != null) {
            FavoritesHiveModel favoritesHiveModel = FavoritesHiveModel()
              ..id = data.id
              ..mealModel =
                  data.mealID == dataAddCategory.id ? dataAddCategory : null
              ..userID = data.userID;
            FavoritesHiveService()
                .addFavoritesData(favoritesHiveModel: favoritesHiveModel);
          }
        }
      }
      update();
    }
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

  bool isFavorites(String id) {
    bool isFavorite = false;
    final data = FavoritesHiveService().getAll();
    if (data != null) {
      for (int i = 0; i < data.length; i++) {
        if (data[i].mealModel!.id == id) {
          isFavorite = true;
          break;
        }
      }
    }

    return isFavorite;
  }

  // bool isFavorites(MealModel mealModel, String id) {
  //   bool isFavorite = false;

  //   for (int i = 0; i < favoritesList.length; i++) {
  //     if (favoritesList[i].id == id) {
  //       isFavorite = true;
  //       break;
  //     }
  //   }

  //   return isFavorite;
  // }
  deleteFavorites(String id) {
    startLoading();
    FavoritesService().deleteOneFavorites(id);
    FavoritesHiveService().deleteFavoritesData(id);
    stopLoading();
  }
}
