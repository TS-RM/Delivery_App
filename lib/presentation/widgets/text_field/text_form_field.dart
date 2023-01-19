import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';

class TextFromFieldApp extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Function validator;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final int maxLines;
  final EdgeInsetsGeometry contentPadding;
  final TextInputAction textInputAction;
  const TextFromFieldApp({
    required this.controller,
    required this.obscureText,
    required this.validator,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
    this.maxLines = 1,
    this.contentPadding = EdgeInsets.zero,
    this.textInputAction = TextInputAction.next,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      obscureText: obscureText,
      maxLines: maxLines,
      textInputAction: textInputAction,
      cursorColor: Theme.of(context).textTheme.headlineLarge!.color,
      keyboardType: TextInputType.text,
      validator: (value) => validator(value),
      style: TextStyle(
        color: Theme.of(context).textTheme.headlineLarge!.color,
      ),
      decoration: InputDecoration(
        contentPadding: contentPadding,
        fillColor: Get.isDarkMode
            ? Theme.of(context).cardColor
            : authTextFromFieldFillColor.withOpacity(.3),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          color: authTextFromFieldHintTextColor,
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: authTextFromFieldPonderColor.withOpacity(.5),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: authTextFromFieldPonderColor.withOpacity(.5),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: authTextFromFieldErrorBorderColor.withOpacity(.5),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
