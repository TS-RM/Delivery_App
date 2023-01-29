import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/cart_controllers.dart';
import 'package:tashil_food_app/core/logic/controllers/checkout_controller.dart';
import 'package:tashil_food_app/presentation/widgets/auth/auth_button.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

import '../../widgets/cart/checkout/add_card_button.dart';
import '../../widgets/cart/checkout/addres.dart';
import '../../widgets/cart/checkout/delivery_address.dart';
import '../../widgets/cart/checkout/list_tile_card.dart';
import '../../widgets/cart/checkout/order_details.dart';
import '../../widgets/cart/checkout/payment_card.dart';
import '../../widgets/cart/checkout/show_order_dit.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);
  final controller = Get.find<CheckoutController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    final dataOrderSend = cartController.orderAndCartData;
    final dataOrder = cartController.orderAndCartData!.cartData!;
    final totalPrice =
        cartController.orderAndCartData!.priceOrder!.toDouble() + 10.0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        title: Text(
          'Checkout'.tr,
          style: TextStyle(
            color: Theme.of(context).textTheme.headlineLarge!.color!,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Stack(
            children: [
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DeliveryAddress(),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GetBuilder<CheckoutController>(builder: (_) {
                            return Address(
                              address:
                                  controller.addressModel.city ?? 'Unknown'.tr,
                            );
                          }),
                          TextButton(
                            onPressed: () {
                              // Get.toNamed(ScreenName.changeAddressScreen);
                              Get.toNamed(ScreenName.showAddress,
                                  arguments: {'inRoute': true});
                            },
                            child: Text(
                              "Change".tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: mainColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 10,
                      width: double.infinity,
                      color: Colors.grey.withOpacity(.1),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const OrderDetails(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .35,
                      width: double.infinity,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: dataOrder.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTileCard(
                            cartModel: dataOrder[index],
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 10,
                      width: double.infinity,
                      color: Colors.grey.withOpacity(.1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWithFont().textShow(
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .color!
                                  .withOpacity(.8),
                              fontSize: 16.sp,
                              text: "Payment method".tr,
                              fontWeight: FontWeight.w500),
                          TextButton(
                            onPressed: () {
                              // showModalBottomSheetCardBy(context);
                            },
                            child: const AddCardButton(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<CheckoutController>(
                      builder: (_) => SizedBox(
                        height: MediaQuery.of(context).size.height * .20,
                        width: double.infinity,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.paymentMethod.length,
                          itemBuilder: (BuildContext context, int index) {
                            return controller.paymentMethod.isNotEmpty
                                ? Padding(
                                    padding: EdgeInsets.only(bottom: 10.h),
                                    child: PaymentCard(
                                      onClick: () {
                                        controller.addPayment(
                                            totalPrice: totalPrice);
                                      },
                                      paymentModel:
                                          controller.paymentMethod[index],
                                    ),
                                  )
                                : CircularProgressIndicator(
                                    color: mainColor,
                                  );
                          },
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    Container(
                      height: 10,
                      width: double.infinity,
                      color: Colors.grey.withOpacity(.1),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ShowOrderDit(total: totalPrice),
                    SizedBox(
                      height: 60.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 215, 213, 213),
                ),
                child: GetBuilder<CheckoutController>(builder: (_) {
                  return Visibility(
                    visible:
                        controller.statusPayment && controller.statusAddress,
                    replacement: Text(
                      'Add your address and pay for current order to start process it'
                          .tr,
                      style: const TextStyle(color: Colors.black87),
                    ),
                    child: controller.isLoading
                        ? const CircularProgressIndicator()
                        : AuthButton(
                            press: () {
                              controller.sendOrder(
                                  cartDataModel: dataOrderSend!,
                                  addressModel: controller.addressModel,
                                  totalPrice: totalPrice);
                              // showModalBottomSheetDone(context);
                            },
                            text: 'Send Order'.tr,
                          ),
                  );
                })),
          ),
        ),
      ]),
    );
  }
}
