import 'package:flutter/material.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class CustomRowHomePage extends StatelessWidget {
  final String firstText;
  final String scendText;
  final Function? press;

  const CustomRowHomePage({
    Key? key,
    required this.firstText,
    required this.scendText,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWithFont().textShow(
            text: firstText,
            color: Theme.of(context).textTheme.headlineLarge!.color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          GestureDetector(
            onTap: press as void Function()?,
            child: TextWithFont().textShow(
              text: scendText,
              color: mainColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
