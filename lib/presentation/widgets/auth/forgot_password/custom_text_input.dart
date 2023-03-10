import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    super.key,
    required String hintText,
    EdgeInsets padding = const EdgeInsets.only(left: 40),
  })  : _hintText = hintText,
        _padding = padding;

  final String _hintText;
  final EdgeInsets _padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: ShapeDecoration(
        color: Get.isDarkMode
            ? Theme.of(context).cardColor
            : authTextFromFieldFillColor.withOpacity(.5),
        shape: const StadiumBorder(),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: _hintText,
          hintStyle: const TextStyle(
            color: authTextFromFieldHintTextColor,
          ),
          contentPadding: _padding,
        ),
      ),
    );
  }
}
