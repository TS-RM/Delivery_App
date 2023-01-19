import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/search_controller.dart';
import 'package:tashil_food_app/presentation/screens/search/search_for_meal.dart';
import '../../widgets/search/filter_container.dart';
import '../../widgets/search/search_app_bar.dart';
import '../../widgets/search/search_text_field.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final bool empty = true;
  final searchController = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: const SearchAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 60.h,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchTextField(),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    const FilterContainer(),
                  ],
                ),
              ),
              // Container(
              //   // color: Colors.amber,
              //   width: double.infinity,
              //   height: 30.h,
              //   margin: EdgeInsets.symmetric(
              //     vertical: 20.h,
              //   ),
              //   child: TabBar(
              //     labelColor: mainColor,
              //     indicatorColor: mainColor,
              //     unselectedLabelColor: Colors.grey,
              //     tabs: [
              //       Tab(
              //         text: 'Meals'.tr,
              //       ),
              //       // Tab(
              //       //   text: 'Restaurants',
              //       // ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: Get.height * .73,
                child: SearchForMeal(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// ItemCard(),