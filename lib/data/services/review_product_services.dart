import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/data/services/baseAPI.dart';
import 'package:tashil_food_app/data/services/helper/crud.dart';

class ReviewProduct {
  static showProductReviews(String productId) async {
    var url = '${BaseAPI.authPath}' + '/products/$productId/reviews';

    var response = await Crud.getData(
      url,
    );
    return response.fold((l) => l, (r) => r);
  }

  static addReviewProduct(String feedback, int rate, String productId) async {
    var url = '${BaseAPI.authPath}' + '/products/$productId/review';
    var body = jsonEncode({'rate': rate, 'feedback': feedback});

    var response = await Crud.postData(
      url,
      body,
      Options(headers: {
        'Authorization': 'Bearer ${SharedPref.instance.getString('token')}'
      }),
    );

    return response.fold((l) => l, (r) => r);
  }
}
