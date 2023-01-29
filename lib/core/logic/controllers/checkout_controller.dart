import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/data/address/model/address_model.dart';
import 'package:tashil_food_app/data/bills/model/bill_model.dart';
import 'package:tashil_food_app/data/bills/service/bill_service.dart';
import 'package:tashil_food_app/data/cart/model/cart_data_model.dart';
import 'package:tashil_food_app/data/cart/service/cart_hive_service.dart';
import 'package:tashil_food_app/data/cart/service/cart_services.dart';
import 'package:tashil_food_app/data/paymet/model/payment_model.dart';
import 'package:tashil_food_app/data/paymet/service/payment_service.dart';
import 'package:tashil_food_app/presentation/widgets/get_snackbar.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

class CheckoutController extends GetxController {
  var adders;
  AddressModel addressModel = AddressModel();
  List<PaymentModel> paymentMethod = [];
  bool statusPayment = false;
  bool statusAddress = false;
  var storage = SharedPref.instance;

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
    String id = storage.getString('id') ?? '';
    if (id != '') {
      await address();
      print(adders);
      getPaymentMethod();
    }
    super.onInit();
  }

  address() async {
    adders = SharedPref.instance.getString("currentAddress");
    update();
  }

  updateAddress() {
    final address = SharedPref.instance.getString("AddressUser") as String;
    final userAddress = AddressModel.decodeModel(address);
    addressModel = userAddress;
    statusAddress = true;
    update();
  }

  void getPaymentMethod() async {
    final dataReturn = await PaymentService().getAllPaymentMethod();
    if (dataReturn != null) {
      paymentMethod.addAll(dataReturn);
      update();
    }
  }

  addPayment({required double totalPrice}) {
    if (totalPrice >= 800) {
      getSnackbar(
          title: 'ملاحضة في الدفع',
          supTitle: 'لم تتم عملية الدفع قم بدفع قيمة الطلب');
    } else {
      statusPayment = true;
      update();
    }
  }

  sendOrder({
    required CartDataModel cartDataModel,
    required AddressModel addressModel,
    required double totalPrice,
    double discount = 0.0,
  }) async {
    startLoading();
    String id = storage.getString('id') ?? '';
    if (id != '') {
      BillModel billModel = BillModel()
        ..addressID = addressModel.id
        ..billPrice = totalPrice
        ..createdDate = DateTime.now()
        ..deliveryPrice = 10.0
        ..discount = discount
        ..orderID = cartDataModel.orderId
        ..status = 1
        ..totalPrice = totalPrice
        ..transID = '121'
        ..userID = id;
      final isReturn = await BillService().addBill(billModel);
      if (isReturn != null && isReturn) {
        CartServices().updateOrder(cartDataModel.orderId.toString());
        getSnackbar(
            title: 'تمت أضافة طلبك بنجاح',
            supTitle: 'أذهب الي الطلبات كي تشاهد طلبك الي ان يصل اليك');
        Get.offNamedUntil(
          ScreenName.mainScreen,
          (route) => false,
        );
        CartHiveService().deleteAll();
        // storage.remove('cartDataList');
        statusAddress = false;
        statusPayment = false;
        stopLoading();
      }
    }
  }
}
