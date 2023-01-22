import 'package:hive/hive.dart';
import 'package:tashil_food_app/data/address/model/address_model.dart';
import 'package:tashil_food_app/data/auth/model/user_hive_model.dart';
import 'package:tashil_food_app/data/cart/model/cart_data_model.dart';
import 'package:tashil_food_app/data/favorites/model/favorites_hive_model.dart';

class Boxes {
  static Box<UserHiveModel> getUser() =>
      Hive.box<UserHiveModel>('dataUser'); // box 0

  static Box<CartDataModel> getCartData() =>
      Hive.box<CartDataModel>('CartData'); // box 1

  static Box<AddressModel> getAddressData() =>
      Hive.box<AddressModel>('dataAddress'); // box 3

  static Box<FavoritesHiveModel> getFavoritesData() =>
      Hive.box<FavoritesHiveModel>('dataFavorites'); // box 4

}
