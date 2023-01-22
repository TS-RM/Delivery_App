import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:tashil_food_app/data/firebase/crud_firebase.dart';
import '../../../constants/enums/status_request.dart';

class HomeServices {
  static viewHomeCategory() async {
    var response =
        await CrudFirebase().readDataAll(tableName: 'MeelsCatigories');
    return response.fold((l) => l, (r) => r);
  }

  static viewMealsForCategory(String value) async {
    var response = await CrudFirebase().readDataWhereNoEither(
        tableName: 'Meals', fieldName1: 'category', value1: value);
    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  static viewCategoryById(String value) async {
    var response = await CrudFirebase().readDataWhere(
        tableName: 'MeelsCatigories', fieldName1: 'id', value1: value);
    return response.fold((l) => l, (r) => r);
  }

  static viewHomeMeals() async {
    var response = await CrudFirebase().readDataLimitAndOrderBy(
        tableName: 'Meals', orderByField: 'addedDate', limit: 5);
    return response.fold((l) => l, (r) => r);
  }

  static viewMealById() async {
    var response = await CrudFirebase().readDataAll(tableName: 'Meals');
    return response.fold((l) => l, (r) => r);
  }

  static viewHomeOffers() async {
    var response = await CrudFirebase().readDataAll(tableName: 'Offer');
    return response.fold((l) => l, (r) => r);
  }
}
