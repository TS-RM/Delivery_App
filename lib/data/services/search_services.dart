import 'package:tashil_food_app/data/firebase/crud_firebase.dart';

class SearchServices {
  // static Future<List<DataRestaurant>> viewRestaurantsSearch(
  //     int pageIndex, String searchVal) async {
  //   var url = '${BaseAPI.authPath}' + '/search';

  //   var response = await Dio().get(url, queryParameters: {
  //     "pagesize": 10,
  //     "page": pageIndex,
  //     'search_query': searchVal
  //   });

  //   final dataList = (response.data['data']['Restaurant']['data'] as List)
  //       .map((e) => DataRestaurant.fromJson(e))
  //       .toList();

  //   if (response.statusCode == 200) {
  //     final dataList = (response.data['data']['Restaurant']['data'] as List)
  //         .map((e) => DataRestaurant.fromJson(e))
  //         .toList();
  //   } else {
  //     print('response.reasonPhrase');
  //   }
  //   return dataList;
  // }

  // static Future<List<DataProducts>> viewFoodsSearch(
  //     int pageIndex, String searchVal) async {
  //   var url = '${BaseAPI.authPath}' + '/search';

  //   var response = await Dio().get(url, queryParameters: {
  //     "pagesize": 10,
  //     "page": pageIndex,
  //     'search_query': searchVal
  //   });

  //   final dataList = (response.data['data']['Products']['data'] as List)
  //       .map((e) => DataProducts.fromJson(e))
  //       .toList();
  //   return dataList;
  // }

  // TODO
  static viewMealsSearch(String searchVal) async {
    final response = await CrudFirebase().readDataWhereIsSearch(
        tableName: 'Meals', fieldName1: 'name', value1: searchVal);
    return response;
  }
}
//   static Future<List<dynamic>> viewAllCategories(int pageIndex) async {
//     var url = '${BaseAPI.authPath}' + '/restaurants';

//     var response = await Dio().get(url, queryParameters: {
//       "pagesize": 5,
//       "page": pageIndex,
//     });

//     final dataList = (response.data['data']['categories'] as List).toList();
//     return dataList;
//   }
// }

// static Future<List<dynamic>> viewAllCategories(int pageIndex) async {
//   var url = '${BaseAPI.authPath}' + '/restaurants';

//   var response = await Dio().get(url, queryParameters: {
//     "pagesize": 5,
//     "page": pageIndex,
//   });

//   final dataList = (response.data['data']['categories'] as List).toList();
//   return dataList;
// }
