import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/data/order/model/order_model.dart';
import 'package:tashil_food_app/data/order/service/order_service.dart';

class OrderController extends GetxController {
  var orderDataInProgress = <OrderModel>[].obs;
  var orderDataInFinished = <OrderModel>[].obs;
  var storage = SharedPref.instance;
  String cartListString = '';

  bool isLoading = false;

  void startLoading() {
    isLoading = true;
    update();
  }

  void stopLoading() {
    isLoading = false;
    update();
  }

  @override
  void onInit() async {
    getOrderInProgress();
    getOrderInFinished();
    super.onInit();
  }

  getOrderInProgress() async {
    String id = storage.getString('id') ?? '';
    if (id != '') {
      startLoading();
      final data = await OrderService().getOrderById(id, 2);
      if (data != null) {
        orderDataInProgress.assignAll(data);
        orderDataInProgress.refresh();
        stopLoading();
      } else {
        stopLoading();
      }
    }
  }

  getOrderInFinished() async {
    String id = storage.getString('id') ?? '';
    if (id != '') {
      startLoading();
      final data = await OrderService().getOrderById(id, 3);
      if (data != null) {
        orderDataInFinished.assignAll(data);
        orderDataInFinished.refresh();
        stopLoading();
      } else {
        stopLoading();
      }
    }
  }
}
