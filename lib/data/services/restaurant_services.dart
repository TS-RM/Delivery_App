// import 'package:dio/dio.dart';
// import 'package:tashil_food_app/data/services/baseAPI.dart';
// import 'package:tashil_food_app/data/services/helper/crud.dart';

// import '../model/restaurants_details_model.dart';

// class RestaurantApi {
//   static viewAllRestaurants(int pageIndex) async {
//     var url = '${BaseAPI.authPath}' + '/restaurants';

//     var response = await Crud.getData(url, map: {
//       "pagesize": 5,
//       "page": pageIndex,
//     });
//     return response.fold((l) => l, (r) => r);
//   }

//   static viewRestaurantsWithOutPage() async {
//     var url = '${BaseAPI.authPath}' + '/restaurants';

//     var response = await Crud.getData(
//       url,
//     );
//     return response.fold((l) => l, (r) => r);

//     // var response = await Dio().get(
//     //   url,
//     // );

//     // final dataList = (response.data['data']['restaurants']['data'] as List)
//     //     .map((e) => DataOfRestaurant.fromJson(e))
//     //     .toList();
//     // return dataList;
//   }

//   static Future<List<dynamic>> viewAllCategories(int pageIndex) async {
//     var url = '${BaseAPI.authPath}' + '/restaurants';

//     var response = await Dio().get(url, queryParameters: {
//       "pagesize": 5,
//       "page": pageIndex,
//     });

//     final dataList = (response.data['data']['categories'] as List).toList();
//     return dataList;
//   }

//   static Future<Data> viewRestaurantById({required String id}) async {
//     var url = '${BaseAPI.authPath}' + '/restaurants/' + '$id';
//     var response = await Dio().get(
//       url,
//     );
//     Map<String, dynamic> data = new Map<String, dynamic>.from(response.data);
//     final prodectData = Data.fromJson(data['data'][0]);
//     return prodectData;
//   }
// }
