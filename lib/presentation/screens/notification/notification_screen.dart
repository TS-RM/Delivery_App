import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        title: Text(
          'Notification'.tr,
          style: TextStyle(
            color: Theme.of(context).textTheme.headlineLarge!.color,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: authTextFromFieldFillColor.withOpacity(.1),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset('assets/images/profile.png',
                          height: 70.0.h, width: 70.w),
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWithFont().textShow(
                            color: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .color!,
                            fontSize: 16.sp,
                            text: 'Unkown User'.tr,
                            fontWeight: FontWeight.bold),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextWithFont().textShow(
                            color: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .color!,
                            fontSize: 14.sp,
                            text: 'simply dummy text of the printing',
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            TextWithFont().textShow(
                                color: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .color!
                                    .withOpacity(.6),
                                fontSize: 14.sp,
                                text: 'Today',
                                fontWeight: FontWeight.w400),
                            SizedBox(
                              width: 100.h,
                            ),
                            TextWithFont().textShow(
                                color: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .color!
                                    .withOpacity(.6),
                                fontSize: 14.sp,
                                text: '12:00Pm',
                                fontWeight: FontWeight.w400),
                          ],
                        ),
                      ],
                    ),
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
