import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/cart_controllers.dart';
import 'package:tashil_food_app/data/cart/model/cart_model.dart';
import 'package:tashil_food_app/presentation/widgets/cart/counter.dart';

class ListViewItem extends StatelessWidget {
  ListViewItem({
    Key? key,
    required this.cartModel,
  }) : super(key: key);

  // final CartDataModel cartDataModel;
  final CartModel cartModel;
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('item ${cartModel.id}'),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cartController.deleteFromCart(
            idOrder: cartController.orderAndCartData!.orderId.toString(),
            cartID: cartModel.id.toString());
      },
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: const Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.delete,
            ),
          ),
        ),
      ),
      child: Card(
        color: Theme.of(context).cardColor,
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(.3),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 34,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(
                        Icons.photo_rounded,
                        color: Colors.grey.shade700,
                        size: 100,
                      ),
                      height: 75.0.h,
                      width: 75.w,
                      fit: BoxFit.cover,
                      imageUrl: cartModel.image!,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartModel.name!,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color:
                              Theme.of(context).textTheme.headlineLarge!.color),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '\$ ${cartModel.unitPrice! * cartModel.quantity!}',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: mainColor),
                    )
                  ],
                ),
              ],
            ),
          ),
          trailing: SizedBox(
            width: 120.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GetBuilder<CartController>(
                    builder: (value) => Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Counter(
                          icon: Icons.exposure_minus_1,
                          onPressed: () {
                            cartController.counterRemoveMealToCart(
                                cartController.orderAndCartData!.orderId
                                    .toString(),
                                cartModel);
                          },
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          // '${cartDataModel.quantity}',
                          '${cartModel.quantity}',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .color),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Counter(
                          icon: Icons.exposure_plus_1,
                          onPressed: () {
                            // print(cartController.orderAndCartData!.orderId
                            //     .toString());
                            cartController.counterAddProductToCart(
                                cartController.orderAndCartData!.orderId
                                    .toString(),
                                cartModel);
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
