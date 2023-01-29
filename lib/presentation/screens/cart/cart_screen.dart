import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tashil_food_app/constants/init/init_boxses.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/cart_controllers.dart';
import 'package:tashil_food_app/data/cart/model/cart_data_model.dart';
import 'package:tashil_food_app/presentation/widgets/auth/check_session_user.dart';
import 'package:tashil_food_app/presentation/widgets/get_snackbar.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

import '../../widgets/auth/auth_button.dart';
import '../../widgets/cart/app_bar_cart.dart';
import '../../widgets/cart/custom_card.dart';
import '../../widgets/cart/list_view_item.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCart(
        onPressed: () {
          cartController.orderAndCartData != null
              ? cartController.deleteFromOrder(
                  idOrder: cartController.orderAndCartData!.orderId.toString())
              : null;
        },
      ),
      body: CheckSessionUser(
        child: ValueListenableBuilder<Box<CartDataModel>>(
          valueListenable: Boxes.getCartData().listenable(),
          builder: (context, cartData, child) {
            if (cartData.isNotEmpty) {
              final order = cartData.values.first;
              return buildCart(order, context, controller: cartController);
            } else {
              return cartController.isLoading
                  ? CircularProgressIndicator(
                      color: mainColor,
                    )
                  : notOrder(context: context);
            }
          },
        ),
      ),
    );
  }
}

Widget buildCart(CartDataModel cartDataModel, BuildContext context,
    {required CartController controller}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        GetBuilder<CartController>(
            builder: (controller) =>
                // cartController.orderAndCartData.value.orderId != null
                // ?
                // controller.orderAndCartData?.orderId != null
                // cartDataModel.orderId != null
                //     ?
                getItemCart(
                    controller: controller,
                    context: context,
                    cartDataModel: cartDataModel)
            // :

            // notMeals(
            // controller: cartController, context: context)
            // : notOrder(context: context),
            ),
        GetBuilder<CartController>(
          builder: (_) {
            return SizedBox(
                height: Get.height * .3,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      CustomCard(
                        total: cartDataModel.priceOrder?.toDouble() ?? 0.0,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      // cartController.orderAndCartData.value.orderId !=
                      //         null
                      // ?
                      Visibility(
                        visible: cartDataModel != null,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: AuthButton(
                              text: 'Checkout'.tr,
                              press: cartDataModel.cartData != null
                                  ? () {
                                      // controller.printData();
                                      if (controller.orderAndCartData!.cartData!
                                          .isNotEmpty) {
                                        Get.toNamed(ScreenName.checkoutScreen);
                                      }
                                    }
                                  : () {
                                      getSnackbar(
                                          title: 'title',
                                          supTitle:
                                              'ليس لديك منتجات في السله عفوا');
                                    }),
                        ),
                      ),
                    ]),
                  ),
                ));
          },
        ),
      ],
    ),
  );
}

Widget getItemCart(
    {required CartDataModel cartDataModel,
    required CartController controller,
    required BuildContext context}) {
  return cartDataModel.cartData?.isNotEmpty ?? false
      ? Expanded(
          flex: 6,
          // height: Get.height * .48,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: cartDataModel.cartData?.length,
            itemBuilder: (BuildContext context, int index) => ListViewItem(
              cartModel: cartDataModel.cartData![index],
            ),
          ),
        )
      : notMeals(controller: controller, context: context);
}

Widget notOrder({required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Expanded(
            flex: 2,
            // height: Get.height * .30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  "You don't have a request in the cart".tr,
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .color!
                        .withOpacity(.5),
                  ),
                )),
              ],
            ))
      ],
    ),
  );
}

Widget notMeals(
    {required CartController controller, required BuildContext context}) {
  return Expanded(
      flex: 6,
      // height: Get.height * .30,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "No Foods In Cart".tr,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .color!
                  .withOpacity(.5),
            ),
          )),
          SizedBox(
            height: Get.height * .10,
          ),
          AuthButton(
            text: 'تحديث السله',
            press: () {
              controller.getDataOrderAndCart();
            },
          )
        ],
      ));
}
