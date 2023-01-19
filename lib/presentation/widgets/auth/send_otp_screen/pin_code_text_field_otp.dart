import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tashil_food_app/core/logic/controllers/auth/auth_controllers.dart';

class PinCodeTextFieldOTP extends StatelessWidget {
  const PinCodeTextFieldOTP({
    Key? key,
    required this.controller,
    required this.controllerText,
    required this.validator,
  }) : super(key: key);

  final AuthController controller;
  final TextEditingController controllerText;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controllerText,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(15),
        fieldHeight: 50.h,
        fieldWidth: 40.w,
        activeFillColor: const Color(0xFFEAEDF0),
        activeColor: const Color(0xFFEAEDF0),
        inactiveFillColor: const Color(0xFFEAEDF0),
        inactiveColor: const Color(0xFFEAEDF0),
        selectedColor: const Color(0xFFEAEDF0),
        selectedFillColor: const Color(0xFFEAEDF0),
      ),
      onChanged: (value) => controller.currentTextPinCode(value),
      validator: (value) => validator(value),
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
      animationDuration: const Duration(milliseconds: 300),
      appContext: context,
      enableActiveFill: true,
      keyboardType: TextInputType.number,
    );
  }
}

class OTPInput extends StatelessWidget {
  const OTPInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: ShapeDecoration(
        color: Colors.grey.withOpacity(.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Stack(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 18, left: 20),
            child: Text(
              "*",
              style: TextStyle(fontSize: 45),
            ),
          ),
          TextField(
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ],
      ),
    );
  }
}
