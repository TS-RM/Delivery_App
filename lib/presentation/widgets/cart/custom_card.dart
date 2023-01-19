import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/presentation/widgets/cart/custom_row.dart';
import 'package:tashil_food_app/presentation/widgets/cart/my_separator.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.total,
  }) : super(key: key);
  final double total;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(.3),
      child: Column(
        children: [
          CustomRow(
            FontWeight.normal,
            Colors.black,
            name: 'Shipping'.tr,
            price: '10\$',
            color: Theme.of(context).textTheme.headlineLarge!.color!,
          ),
          const MySeparator(color: Colors.grey),
          CustomRow(
            FontWeight.bold,
            mainColor,
            name: 'Total Price'.tr,
            price: '${total + 10}\$',
            color: mainColor,
          ),
        ],
      ),
    );
  }
}
