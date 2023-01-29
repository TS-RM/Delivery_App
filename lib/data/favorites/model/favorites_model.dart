import 'dart:convert';

import 'package:tashil_food_app/data/meals/model/meal_model.dart';

class FavoritesModel {
  String? id;
  String? mealID;
  String? userID;
  MealModel? mealModel;

  static String tableName = 'Favorites';

  FavoritesModel({
    this.id,
    this.mealModel,
    this.mealID,
    this.userID,
  });

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mealID = json['mealID'];
    userID = json['userID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mealID'] = mealID;
    data['userID'] = userID;
    return data;
  }

  static Map<String, dynamic> toMap(FavoritesModel favoritesData) => {
        'id': favoritesData.id,
        'mealID': favoritesData.mealID,
        'userID': favoritesData.userID,
      };
  static String encode(List<FavoritesModel> musics) => json.encode(
        musics
            .map<Map<String, dynamic>>((music) => FavoritesModel.toMap(music))
            .toList(),
      );

  static List<FavoritesModel> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<FavoritesModel>((item) => FavoritesModel.fromJson(item))
          .toList();
}
