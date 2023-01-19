import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/data/order/model/order_model.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class TapBarScreen extends StatelessWidget {
  TapBarScreen({Key? key, required this.orders}) : super(key: key);
  final List item = [
    {"title": "Button One", "color": 50},
    {"title": "Button Two", "color": 100},
    {"title": "Button Three", "color": 200},
    {"title": "No show", "color": 0, "hide": '1'},
  ];

  final List<OrderModel> orders;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 40.w,
          left: 20.w,
          right: 20.w,
        ),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(30), // Image radius
                        child: Image.asset('assets/images/hamburger.jpeg',
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWithFont().textShow(
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                            fontSize: 18.sp,
                            text: orders[index].totalPrice.toString(),
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            TextWithFont().textShow(
                                color:
                                    Get.isDarkMode ? Colors.white : mainColor,
                                fontSize: 16.sp,
                                text: 'ID: ',
                                fontWeight: FontWeight.bold),
                            TextWithFont().textShow(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16.sp,
                                text:
                                    orders[index].id.toString().substring(0, 4),
                                fontWeight: FontWeight.normal),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 60.h,
                    ),
                    orders[index].status == 2
                        ? TextWithFont().textShow(
                            color: Get.isDarkMode ? Colors.white : Colors.amber,
                            fontSize: 16.sp,
                            text: 'Waiting',
                            fontWeight: FontWeight.w500)
                        : TextWithFont().textShow(
                            color: Get.isDarkMode ? Colors.white : Colors.green,
                            fontSize: 16.sp,
                            text: 'Waiting',
                            fontWeight: FontWeight.w500),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
