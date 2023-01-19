import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function? press;
  final Color? backcolor;
  final Color? color;

  const AuthButton({
    required this.text,
    this.backcolor,
    this.color,
    Key? key,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press as void Function()?,
      style: ElevatedButton.styleFrom(
        // shadowColor: Colors.white,
        side: BorderSide.none,
        backgroundColor: backcolor,
        minimumSize: Size(337.w, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // <-- Radius
        ),
      ),
      child: TextWithFont().textShow(
        color: color ?? Colors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        text: text,
      ),
    );
  }
}
