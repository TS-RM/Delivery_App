import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/data/paymet/model/payment_model.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
    required this.paymentModel,
    required this.onClick,
  });
  final PaymentModel paymentModel;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.grey.withOpacity(.1),
              ),
            ),
            color: Colors.grey.withOpacity(.1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 60,

                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(
                    Icons.photo_rounded,
                    color: Colors.grey.shade700,
                    size: 100,
                  ),
                  // height: 40.0.h,
                  // width: 40.w,
                  fit: BoxFit.cover,
                  imageUrl: paymentModel.logo.toString(),
                ),
                // Image.asset(
                //   "assets/images/visa2.png",
                // ),
              ),
              Text(paymentModel.title.toString(),
                  style: TextStyle(
                      color: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .color!
                          .withOpacity(.6))),
              Container(
                width: 15,
                height: 15,
                decoration: const ShapeDecoration(
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.orange),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
