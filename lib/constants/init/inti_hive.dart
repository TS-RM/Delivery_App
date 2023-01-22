import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tashil_food_app/data/address/model/address_model.dart';
import 'package:tashil_food_app/data/auth/model/user_hive_model.dart';
import 'package:tashil_food_app/data/cart/model/cart_data_model.dart';
import 'package:tashil_food_app/data/cart/model/cart_model.dart';
import 'package:tashil_food_app/data/favorites/model/favorites_hive_model.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';

class InitHive {
  static Future initBoxHive() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDirectory.path);

    Hive.registerAdapter(UserHiveModelAdapter());
    await Hive.openBox<UserHiveModel>('dataUser'); // box 0

    Hive.registerAdapter(CartDataModelAdapter());
    Hive.registerAdapter(CartModelAdapter());
    await Hive.openBox<CartDataModel>('CartData'); // box 1
    await Hive.openBox<CartModel>('Cart'); // box 2

    Hive.registerAdapter(AddressModelAdapter());
    await Hive.openBox<AddressModel>('dataAddress'); // box 3

    Hive.registerAdapter(FavoritesHiveModelAdapter());
    Hive.registerAdapter(MealModelAdapter());
    await Hive.openBox<FavoritesHiveModel>('dataFavorites'); // box 4
    await Hive.openBox<MealModel>('dataMeal'); // box 5
  }
}
