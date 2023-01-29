import 'package:tashil_food_app/data/favorites/model/favorites_model.dart';
import 'package:tashil_food_app/data/firebase/crud_firebase.dart';

class FavoritesService {
  Future<FavoritesModel> addToFavorites({
    required FavoritesModel favoritesModel,
  }) async {
    final address = await CrudFirebase().createData(
        tableName: FavoritesModel.tableName, data: favoritesModel.toJson());
    if (address != null) {
      final data = FavoritesModel.fromJson(address);
      return data;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future<List<FavoritesModel>?> getAllFavorites(String value) async {
    var response = await CrudFirebase().readDataWhereNoEither(
        tableName: FavoritesModel.tableName,
        fieldName1: 'userID',
        value1: value);
    if (response != null) {
      final dataResponse =
          response.map((data) => FavoritesModel.fromJson(data)).toList();
      return dataResponse;
    } else {
      return null;
    }
  }

  deleteOneFavorites(String id) {
    CrudFirebase().deleteData(tableName: FavoritesModel.tableName, id: id);
  }
}
