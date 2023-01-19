import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/order_controller.dart';
import 'package:tashil_food_app/presentation/screens/order_screen/tab_bar_screen.dart';
import 'package:tashil_food_app/presentation/widgets/auth/check_session_user.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

class MyOrdersScreen extends StatelessWidget {
  MyOrdersScreen({Key? key}) : super(key: key);

  // late TabController _tabController;
  final orderController = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'Order'.tr,
            style: TextStyle(
                color: Theme.of(context).textTheme.headlineLarge!.color),
          ),
          elevation: 1,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: (() {
                Get.toNamed(ScreenName.notificatonScreen);
              }),
              child: Padding(
                padding: Get.locale?.languageCode == 'en'
                    ? EdgeInsets.only(right: 25.w, left: 0)
                    : EdgeInsets.only(right: 0, left: 25.w),
                child: Icon(
                  Icons.notifications_none_rounded,
                  size: 30,
                  color: Theme.of(context).textTheme.headlineLarge!.color,
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TabBar(
                labelColor: mainColor,
                indicatorColor: mainColor,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'In Progress'.tr,
                  ),
                  Tab(
                    text: 'Finished'.tr,
                  ),
                ],
              ),
            ),
          ),
        ),
        body:
            // Obx(
            // () =>
            TabBarView(children: [
          GetBuilder<OrderController>(
            builder: (_) => CheckSessionUser(
              child: orderController.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    )
                  : orderController.orderDataInProgress.isNotEmpty
                      ? TapBarScreen(
                          orders: orderController.orderDataInProgress)
                      : Center(
                          child: Text(
                            "You don\'t have any orders right now".tr,
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .color!
                                  .withOpacity(.5),
                            ),
                          ),
                        ),
            ),
          ),
          GetBuilder<OrderController>(
            builder: (_) => CheckSessionUser(
              child: orderController.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    )
                  : orderController.orderDataInFinished.isNotEmpty
                      ? TapBarScreen(
                          orders: orderController.orderDataInFinished)
                      : Center(
                          child: Text(
                            "ليس لديك طلبات تم تنفيذها حالياً".tr,
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .color!
                                  .withOpacity(.5),
                            ),
                          ),
                        ),
            ),
          ),
        ]),
      ),
      // ),
    );
  }
}
