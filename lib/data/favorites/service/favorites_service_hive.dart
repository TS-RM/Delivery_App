import 'package:flutter/material.dart';
import 'package:tashil_food_app/constants/init/init_boxses.dart';
import 'package:tashil_food_app/data/favorites/model/favorites_hive_model.dart';

class FavoritesHiveService {
  FavoritesHiveModel? getFavoritesData(String id) {
    final box = Boxes.getFavoritesData();
    final data = box.get(id);
    if (data != null) {
      return data;
    } else {
      return null;
    }
  }

  List<FavoritesHiveModel>? getAll() {
    final box = Boxes.getFavoritesData();
    final dataBox = box.values.toList();
    if (dataBox != null) {
      return dataBox;
    } else {
      return null;
    }
  }

  Future addFavoritesData({
    required FavoritesHiveModel favoritesHiveModel,
  }) async {
    final box = Boxes.getFavoritesData();
    await box.put(favoritesHiveModel.id, favoritesHiveModel);
    debugPrint('${box.keys}');
    debugPrint('تم حفظ  في المفظلة التخزين المحلي');
  }

  void deleteFavoritesData(String id) {
    final box = Boxes.getFavoritesData();
    box.delete(id);
    debugPrint('تم حذف  المفظلة');
  }

  void deleteAllFavorites() {
    final box = Boxes.getFavoritesData();
    box.clear();
    debugPrint('تم حذف كل  المفظلة');
  }
}
