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
    var response = await CrudFirebase().readDataAll(tableName: 'Meals');
    return response.fold((l) => l, (r) => r);
  }

  static viewMealById() async {
    var response = await CrudFirebase().readDataAll(tableName: 'Meals');
    return response.fold((l) => l, (r) => r);
  }

  static viewStaticHomeOffers() async {
    Either<StatusRequest, Map<dynamic, dynamic>> data = right({
      'status': 200,
      'data': {
        'data': [
          {
            'id': 1,
            'title': 'دجاج مشوي علي الفحم',
            'productId': 1,
            'discountPercent': 100,
            'priceAfterDiscount': 200,
            'deadline': '2023-01-02 20:18:04Z',
            'meal': {
              'id': 'ghghghhg',
              'name': 'دجاج مشوي علي الفحم',
              'image': 'assets/images/onboarding/onboarding1.png',
              'rating': 4.0,
              'price': 200,
              'addedDate': Timestamp(1672647166, 935000000),
              'calories': 2,
              'description':
                  'simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also',
              'status': 1,
              'whoAdded': ''
            },
          },
          {
            'id': 2,
            'title': 'كبسة لحم',
            'productId': 2,
            'discountPercent': 50,
            'priceAfterDiscount': 300,
            'deadline': '2022-12-20 11:37:04Z',
            'meal': {
              'id': 'cxxzc',
              'name': 'كبسة لحم',
              'image': 'assets/images/onboarding/onboarding2.png',
              'rating': 4.0,
              'price': 300,
              'addedDate': Timestamp(1672647166, 935000000),
              'calories': 2,
              'description':
                  'simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also',
              'status': 1,
              'whoAdded': ''
            },
          },
        ],
      },
    });
    return data.fold((l) => l, (r) => r);
  }
}
