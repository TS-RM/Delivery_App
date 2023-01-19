import 'package:get/get.dart';
import 'package:tashil_food_app/data/meals/model/meal_model.dart';
import 'package:tashil_food_app/core/helper/handing_data_controller.dart';
import 'package:tashil_food_app/constants/enums/status_request.dart';
import 'package:tashil_food_app/data/services/review_product_services.dart';

class PreviewProductController extends GetxController {
  var reviewProduct = <MealModel>[].obs;
  // late StatusRequest statusReviewProduct;
  // late StatusRequest statusAddReview;
  var isLoading = true.obs;
  double rating = 4.0;

  int? idProduct;
  var currentSelected = 0.obs;

  final List sizeList = [
    5,
    4,
    3,
    2,
    1,
  ].obs;
  @override
  void onInit() {
    var prodectId = Get.arguments['prodectId'];
    print('prodectId $prodectId');
    // idProduct = prodectId as int;
    // showProductReviews(prodectId.toString(), 5);
    isLoading.value = false;
    super.onInit();
  }

  showProductReviews(String productId, int numReviews) async {
    // reviewProduct.value = [];

    // statusReviewProduct = StatusRequest.loading;
    var response = await ReviewProduct.showProductReviews(productId);
    // statusReviewProduct = handlingData(response);
    if (StatusRequest.success == StatusRequest.success) {
      if (response['status'] == 200) {
        final dataList = (response['data'] as List)
            .map((e) => MealModel.fromJson(e))
            .toList();
        for (int i = 0; i < dataList.length; i++) {
          // reviewProduct.addIf(dataList[i].rate == numReviews, dataList[i]);
        }
      } else {
        // statusReviewProduct = StatusRequest.failure;
      }
    }
    update();
  }

  addReviewProduct(String feedback, int rate, String productId) async {
    // statusAddReview = StatusRequest.loading;
    var response =
        await ReviewProduct.addReviewProduct(feedback, rate, productId);
    // statusAddReview = handlingData(response);
    if (StatusRequest.success == StatusRequest.success) {
      if (response['status'] == 200) {
      } else {
        // statusAddReview = StatusRequest.failure;
      }
    }

    update();
  }

  // showFilterReviews(String productId, int numReviews) async {
  //   reviewProduct.value = [];
  //   statusReviewProduct = StatusRequest.loading;
  //   var response = await ReviewProduct.showProductReviews(productId);
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
