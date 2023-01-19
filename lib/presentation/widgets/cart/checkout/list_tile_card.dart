import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/data/cart/model/cart_model.dart';

import '../../../../constants/theme/theme_data.dart';

class ListTileCard extends StatelessWidget {
  const ListTileCard({Key? key, required this.cartModel}) : super(key: key);
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Card(
        elevation: 2,
        child: ListTile(
          // tileColor: Color.fromRGBO(252, 252, 252, 1),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(8.0),
                //   child: Image.asset('assets/images/visa2.png',
                //       height: 70.0.h, width: 70.w),
                // ),
                // SizedBox(
                //   width: 8.w,
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartModel.name.toString(),
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .color!
                            .withOpacity(.8),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(cartModel.quantity.toString(),
                        style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .color!
                                .withOpacity(.6))),
                    // Row(
                    //   children: [
                    //     Image.asset('assets/images/fire.png'),
                    //     SizedBox(
                    //       width: 5.w,
                    //     ),

                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ),
          trailing: SizedBox(
            width: 100.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  '${cartModel.totalPrice}\$',
                  style: TextStyle(color: mainColor),
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
