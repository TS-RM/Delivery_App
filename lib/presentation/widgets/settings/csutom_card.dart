import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/presentation/widgets/settings/costom_column.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

import '../../screens/settings/offer_screen.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).secondaryHeaderColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomColumn(
            onClick: () {
              Get.toNamed(ScreenName.myOrdersScreen);
            },
            text: 'Orders'.tr,
            imageUrl: 'assets/images/bus.png',
          ),
          // CustomColumn(
          //   onClick: () {
          //     Get.to(() => OfferScreen());
          //   },
          //   text: 'Offer'.tr,
          //   imageUrl: 'assets/images/icons/offer.png',
          // ),
          CustomColumn(
            onClick: () {
              Get.toNamed(ScreenName.showAddress,
                  arguments: {'inRoute': false});
            },
            text: 'Address'.tr,
            imageUrl: 'assets/images/map.png',
          )
        ],
      ),
    );
  }
}
