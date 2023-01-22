import 'package:tashil_food_app/data/firebase/crud_firebase.dart';
import 'package:tashil_food_app/data/rating/model/rating_model.dart';

class RatingServices {
  final RatingModel rating = RatingModel();

  Future<RatingModel?> addToRating({
    required RatingModel ratingModel,
  }) async {
    final order = await CrudFirebase()
        .createData(tableName: rating.tableNme, data: ratingModel.toJson());
    if (order != null) {
      final data = RatingModel.fromJsonNotTimeStamp(order);
      return data;
    } else {
      return null;
    }
  }

  editToRating({
    required RatingModel ratingModel,
  }) async {
    await CrudFirebase().upDateData(
        tableName: rating.tableNme,
        id: ratingModel.id.toString(),
        data: ratingModel.toJson());
  }

  Future<RatingModel> getMealById(String id) async {
    final data =
        await CrudFirebase().readDataOneRow(tableName: rating.tableNme, id: id);
    return RatingModel.fromJson(data as Map<String, dynamic>);
  }

  showMealReviews(String mealID) async {
    var response = await CrudFirebase().readDataWhereNoEither(
        tableName: rating.tableNme, fieldName1: 'mealID', value1: mealID);
    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<List<RatingModel>?> showMealReviewsAndNumberRating(
      String mealID, num rate) async {
    var response = await CrudFirebase().readDataWhere2Field(
        tableName: rating.tableNme,
        fieldName1: 'mealID',
        value1: mealID,
        fieldName2: 'rate',
        value2: rate);
    if (response != null) {
      final dataList = response.map((e) => RatingModel.fromJson(e)).toList();
      return dataList;
    } else {
      return null;
    }
  }

  Future<List<RatingModel>?> showReviewsInUser(
      String userID, String mealID) async {
    var response = await CrudFirebase().readDataWhere2FieldString(
        tableName: rating.tableNme,
        fieldName1: 'userID',
        value1: userID,
        fieldName2: 'mealID',
        value2: mealID);
    if (response != null) {
      final dataList = response.map((e) => RatingModel.fromJson(e)).toList();
      return dataList;
    } else {
      return null;
    }
  }
}
