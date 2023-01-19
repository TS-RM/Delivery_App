import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

import '../../auth/forgot_password/custom_text_input.dart';

Future<dynamic> showModalBottomSheetCardBy(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.72,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.clear,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    TextWithFont().textShow(
                        color: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .color!
                            .withOpacity(.5),
                        fontSize: 16.sp,
                        text: "Add Credit/Debit Card",
                        fontWeight: FontWeight.w500),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  color: mainColor.withOpacity(0.5),
                  thickness: 1.5,
                  height: 40,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextInput(hintText: "card Number"),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWithFont().textShow(
                        color: Get.isDarkMode
                            ? Colors.white
                            : Colors.black.withOpacity(.5),
                        fontSize: 15.sp,
                        text: "Expiry",
                        fontWeight: FontWeight.w500),
                    const SizedBox(
                      height: 50,
                      width: 100,
                      child: CustomTextInput(
                        hintText: "MM",
                        padding: EdgeInsets.only(left: 35),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                      width: 100,
                      child: CustomTextInput(
                        hintText: "YY",
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextInput(hintText: "Security Code"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextInput(hintText: "First Name"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextInput(hintText: "Last Name"),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(337.w, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add,
                          ),
                          SizedBox(width: 40),
                          Text("Add Card"),
                          SizedBox(width: 40),
                        ],
                      )),
                ),
              ),
            ],
          ),
        );
      });
}
