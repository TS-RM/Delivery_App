// import 'package:dio/dio.dart';
// import 'package:tashil_food_app/data/services/baseAPI.dart';
// import 'package:tashil_food_app/data/services/helper/crud.dart';

// import '../model/home_product/home_product_data.dart';

// class FoodApi {
//   static Future<List<MealModel>> viewAllFoods(int pageIndex) async {
//     var url = '${BaseAPI.authPath}' + '/products';

//     var response = await Dio().get(url, queryParameters: {
//       "pagesize": 8,
//       "page": pageIndex,
//     });
//     Map<String, dynamic> data = new Map<String, dynamic>.from(response.data);
//     final dataList = (response.data['data']['data'] as List)
//         .map((e) => HomeProductData.fromJson(e))
//         .toList();

//     return dataList;
//   }

//   static viewAllCategories() async {
//     var url = '${BaseAPI.authPath}' + '/categories';

//     var response = await Crud.getData(
//       url,
//     );
//     return response.fold((l) => l, (r) => r);
//   }

//   static filterProdect({
//     required String category,
//     required String subcategory,
//     required int price,
//     required int rating,
//   }) async {
//     var url = '${BaseAPI.authPath}' + '/filter';
//     Map<String, dynamic> map = {
//       'category': category,
//       'subcategory': subcategory,
//       'price': price,
//       'rating': rating
//     };
//     var response = await Crud.getData(url, map: map);
//     return response.fold((l) => l, (r) => r);
//   }

//   static Future<HomeProductData> viewProdectById({required int id}) async {
//     var url = '${BaseAPI.authPath}' + '/products/' + '$id';
//     var response = await Dio().get(
//       url,
//     );
//     Map<String, dynamic> data = new Map<String, dynamic>.from(response.data);
//     // print(data['message']);
//     // print(data['data']);

//     final prodectData = HomeProductData.fromJson(data['data']);

//     return prodectData;
//   }
// }
