import 'package:get/get.dart';
import 'package:tashil_food_app/data/auth/service/user_service.dart';
import 'package:tashil_food_app/data/rating/model/rating_model.dart';
import 'package:tashil_food_app/data/rating/service/rating_service.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';

class PreviewRatingMealController extends GetxController {
  var reviewRatingMeal = <RatingModel>[];
  RatingModel? ratingUser;
  RatingModel? ratingUserEdit;
  bool isLoading = false;
  double rating = 4;
  var storage = SharedPref.instance;
  String? idProduct;
  var currentSelected = 5.obs;
  bool isNull = false;
  String? notDataRating = 'ليس هناك تقيمات';
  String? idUser;
  final List sizeList = [
    5,
    4,
    3,
    2,
    1,
  ].obs;

  void startLoading() {
    isLoading = true;
    update();
  }

  void stopLoading() {
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    idUser = storage.getString('id');
    var mealID = Get.arguments['mealID'];
    print('mealID $mealID');
    idProduct = mealID;
    showProductReviews(mealID.toString());
    checkUserAddRating();
    super.onInit();
  }

  getEdit() {
    startLoading();
    var ratingUser = Get.arguments['ratingUser'] as RatingModel?;
    if (ratingUser != null) {
      ratingUserEdit = ratingUser;
    }
    stopLoading();
  }

  checkUserAddRating() async {
    String id = storage.getString('id') ?? '';
    if (id != '') {
      startLoading();
      final response =
          await RatingServices().showReviewsInUser(id, idProduct.toString());
      if (response != null) {
        ratingUser = response[0];
        stopLoading();
      } else {
        stopLoading();
      }
    }
  }

  showProductReviews(String mealID) async {
    // reviewRatingMeal.value = [];
    // isLoading.value = true;
    startLoading();
    isNull = false;
    reviewRatingMeal.clear();
    var response = await RatingServices().showMealReviews(mealID);
    if (response != null) {
      final dataList =
          (response as List).map((e) => RatingModel.fromJson(e)).toList();
      for (int i = 0; i < dataList.length; i++) {
        final data = await getDataUser(dataList[i]);
        reviewRatingMeal.add(data);
        stopLoading();
      }
    } else {
      isNull = true;
      stopLoading();
    }
  }

  showProductReviews2(String mealID, int numReviews) async {
    startLoading();
    isNull = false;
    reviewRatingMeal.clear();
    var response = await RatingServices()
        .showMealReviewsAndNumberRating(mealID, numReviews);

    if (response != null) {
      for (int i = 0; i < response.length; i++) {
        final data = await getDataUser(response[i]);
        reviewRatingMeal.addIf(response[i].rate == numReviews, data);
        stopLoading();
      }
    } else {
      isNull = true;
      stopLoading();
    }
  }

  Future<RatingModel> getDataUser(RatingModel ratingModel) async {
    final dataUser =
        await UserService().getUserById(ratingModel.userID.toString());
    ratingModel.userData = dataUser;
    return ratingModel;
  }

  addReviewProduct(
      {required String title,
      required num rate,
      required String mealID}) async {
    startLoading();
    String id = storage.getString('id') ?? '';
    if (id != '') {
      RatingModel ratingModel = RatingModel()
        ..mealID = mealID
        ..title = title
        ..rate = rate
        ..createdDate = DateTime.now()
        ..userID = id;
      var response =
          await RatingServices().addToRating(ratingModel: ratingModel);
      if (response != null) {
        print('تمت الاضافة بنجاح');
        final data = await getDataUser(response);
        reviewRatingMeal.add(data);
        stopLoading();
      } else {
        stopLoading();
      }
    }
    update();
  }

  editReviewProduct(
      {required String title,
      required num rate,
      required RatingModel ratingData}) async {
    startLoading();

    RatingModel ratingModel = RatingModel()
      ..mealID = ratingData.mealID
      ..title = title
      ..rate = rate
      ..createdDate = ratingData.createdDate
      ..lastUpdate = DateTime.now()
      ..userID = ratingData.userID
      ..id = ratingData.id;
    var response =
        await RatingServices().editToRating(ratingModel: ratingModel);
    if (response != null) {
      print('تمت التعديل بنجاح');
      final data = await getDataUser(response);
      reviewRatingMeal.add(data);
      stopLoading();
    } else {
      stopLoading();
    }

    update();
  }

  // showFilterReviews(String productId, int numReviews) async {
  //   reviewProduct.value = [];
  //   statusReviewProduct = StatusRequest.loading;
  // var response = await ReviewProduct.showProductReviews(productId);
  //   statusReviewProduct = handlingData(response);
  //   if (StatusRequest.success == statusReviewProduct) {
  //     if (response['status'] == 200) {
  //       final dataList = await (response['data'] as List)
  //           .map((e) => Data.fromJson(e))
  //           .toList();
  //       for (int i = 0; i < dataList.length; i++) {
  //         print(dataList[i].rate == numReviews);
  //         reviewProduct.addIf(dataList[i].rate == numReviews, dataList[i]);
  //       }
  //     } else {
  //       statusReviewProduct = StatusRequest.failure;
  //     }
  //   }

  //   update();
  // }
}
// class PreviewRatingMealController extends GetxController {
//   var reviewRatingMeal = <RatingModel>[].obs;
//   late StatusRequest statusReviewMeal;
//   late StatusRequest statusAddReviewMeal;
//   var isLoading = true.obs;
//   double rating = 4;
//   var storage = SharedPref.instance;
//   String? idProduct;
//   var currentSelected = 5.obs;
//   String? notDataRating = 'ليس هناك تقيمات';

//   final List sizeList = [
//     5,
//     4,
//     3,
//     2,
//     1,
//   ].obs;
//   @override
//   void onInit() {
//     var mealID = Get.arguments['mealID'];
//     print('mealID $mealID');
//     idProduct = mealID;
//     showProductReviews(mealID.toString());
//     isLoading.value = false;
//     super.onInit();
//   }

//   showProductReviews(String mealID) async {
//     // reviewRatingMeal.value = [];
//     // isLoading.value = true;
//     reviewRatingMeal.clear();
//     statusReviewMeal = StatusRequest.loading;
//     var response = await RatingServices().showMealReviews(mealID);
//     statusReviewMeal = handlingData(response);
//     if (statusReviewMeal == StatusRequest.success) {
//       if (response != null) {
//         final dataList =
//             (response as List).map((e) => RatingModel.fromJson(e)).toList();
//         for (int i = 0; i < dataList.length; i++) {
//           final data = await getDataUser(dataList[i]);
//           // reviewRatingMeal.addIf(dataList[i].rate == numReviews, data);
//           reviewRatingMeal.add(data);
//           // isLoading.value = false;
//         }
//       } else {
//         statusReviewMeal = StatusRequest.failure;
//       }
//     }
//     update();
//   }

//   showProductReviews2(String mealID, int numReviews) async {
//     // reviewRatingMeal.value = [];
//     isLoading.value = true;
//     reviewRatingMeal.clear();
//     statusReviewMeal = StatusRequest.loading;
//     var response = await RatingServices().showMealReviews(mealID);
//     statusReviewMeal = handlingData(response);
//     if (statusReviewMeal == StatusRequest.success) {
//       if (response != null) {
//         final dataList =
//             (response as List).map((e) => RatingModel.fromJson(e)).toList();
//         for (int i = 0; i < dataList.length; i++) {
//           final data = await getDataUser(dataList[i]);
//           // reviewRatingMeal.addIf(dataList[i].rate == numReviews, data);
//           reviewRatingMeal.addIf(dataList[i].rate == numReviews, data);
//           isLoading.value = false;
//         }
//       } else {
//         statusReviewMeal = StatusRequest.failure;
//       }
//     }
//     update();
//   }

//   Future<RatingModel> getDataUser(RatingModel ratingModel) async {
//     final dataUser =
//         await UserService().getUserById(ratingModel.userID.toString());
//     ratingModel.userData = dataUser;
//     return ratingModel;
//   }

//   addReviewProduct(
//       {required String title,
//       required num rate,
//       required String mealID}) async {
//     statusAddReviewMeal = StatusRequest.loading;
//     String id = storage.getString('id') ?? '';
//     if (id != '') {
//       RatingModel ratingModel = RatingModel()
//         ..mealID = mealID
//         ..title = title
//         ..rate = rate
//         ..createdDate = DateTime.now()
//         ..userID = id;
//       var response =
//           await RatingServices().addToRating(ratingModel: ratingModel);
//       statusAddReviewMeal = handlingData(response);
//       if (statusAddReviewMeal == StatusRequest.success) {
//         if (response != null) {
//           print('تمت الاضافة بنجاح');
//           final data = await getDataUser(response);
//           reviewRatingMeal.add(data);
//         } else {
//           statusAddReviewMeal = StatusRequest.failure;
//         }
//       }
//     }
//     update();
//   }

//   // showFilterReviews(String productId, int numReviews) async {
//   //   reviewProduct.value = [];
//   //   statusReviewProduct = StatusRequest.loading;
//   // var response = await ReviewProduct.showProductReviews(productId);
//   //   statusReviewProduct = handlingData(response);
//   //   if (StatusRequest.success == statusReviewProduct) {
//   //     if (response['status'] == 200) {
//   //       final dataList = await (response['data'] as List)
//   //           .map((e) => Data.fromJson(e))
//   //           .toList();
//   //       for (int i = 0; i < dataList.length; i++) {
//   //         print(dataList[i].rate == numReviews);
//   //         reviewProduct.addIf(dataList[i].rate == numReviews, dataList[i]);
//   //       }
//   //     } else {
//   //       statusReviewProduct = StatusRequest.failure;
//   //     }
//   //   }

//   //   update();
//   // }
// }
