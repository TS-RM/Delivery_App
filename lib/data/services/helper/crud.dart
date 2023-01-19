import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:tashil_food_app/data/services/check_internet.dart';
import 'package:tashil_food_app/constants/enums/status_request.dart';

class Crud {
  static Future<Either<StatusRequest, Map>> postData(
      String linkUrl, String data, Options options) async {
    try {
      if (await checkInternet()) {
        Response response = await Dio().post(
          linkUrl,
          data: data,
          options: options,
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.data);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      // print(e);
      return const Left(StatusRequest.serverFailure);
    }
  }

  static Future<Either<StatusRequest, Map>> getData(
    String linkUrl, {
    Map<String, dynamic>? map,
  }) async {
    try {
      if (await checkInternet()) {
        Response response = await Dio().get(
          linkUrl,
          queryParameters: map,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> data = Map<String, dynamic>.from(response.data);

          return Right(data);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }

  static Future<Either<StatusRequest, Map>> deleteData(
      String linkUrl, Options options) async {
    try {
      if (await checkInternet()) {
        Response response = await Dio().delete(
          linkUrl,
          options: options,
        );
        // print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic> data = Map<String, dynamic>.from(response.data);

          // print(data);

          return Right(data);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }
}
