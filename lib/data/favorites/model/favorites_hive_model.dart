import 'package:hive/hive.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';
part 'favorites_hive_model.g.dart';

@HiveType(typeId: 4)
class FavoritesHiveModel extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? userID;

  @HiveField(2)
  MealModel? mealModel;

  FavoritesHiveModel({
    this.id,
    this.mealModel,
    this.userID,
  });
}
