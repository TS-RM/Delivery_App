import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';

class ShowOrderDit extends StatelessWidget {
  const ShowOrderDit({
    Key? key,
    required this.total,
  }) : super(key: key);
  final double total;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sub Total details".tr,
                  style: TextStyle(
                      color: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .color!
                          .withOpacity(.6))),
              Text("\$$total",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headlineLarge!.color!))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Shipping".tr,
                  style: TextStyle(
                      color: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .color!
                          .withOpacity(.6))),
              Text("\$10",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headlineLarge!.color!))
            ],
          ),
          Divider(
            height: 40,
            color: mainColor.withOpacity(0.25),
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Price".tr,
                  style: TextStyle(
                      color: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .color!
                          .withOpacity(.6))),
              Text("\$$total",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.headlineLarge!.color!))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
