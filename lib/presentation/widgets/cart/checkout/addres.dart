import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class Address extends StatelessWidget {
  const Address({
    Key? key,
    required this.address,
  }) : super(key: key);
  final String address;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextWithFont().textShow(
          color:
              Theme.of(context).textTheme.headlineLarge!.color!.withOpacity(.8),
          fontSize: 16.sp,
          text: address,
          fontWeight: FontWeight.bold),
    );
  }
}
