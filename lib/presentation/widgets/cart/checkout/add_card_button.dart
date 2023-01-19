import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';

class AddCardButton extends StatelessWidget {
  const AddCardButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.add,
          color: mainColor,
        ),
        Text(
          "Add Card".tr,
          style: TextStyle(fontWeight: FontWeight.bold, color: mainColor),
        )
      ],
    );
  }
}
