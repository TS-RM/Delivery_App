import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/search_controller.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({
    Key? key,
  }) : super(key: key);
  final searchController = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: ((value) {
        searchController.textFormFild.value = value;
        if (value == '') {
          searchController.searchMealList.clear();
          searchController.searchMealList.clear();
        } else {
          searchController.viewSearchProducts(value);
          // searchController.viewSearchRestaurants(value);
        }
      }),
      cursorColor: Theme.of(context).textTheme.headlineLarge!.color,
      style: TextStyle(
        color: Theme.of(context).textTheme.headlineLarge!.color,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        prefixIcon: const Icon(
          Icons.search,
          color: authTextFromFieldHintTextColor,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        hintText: 'Search for a food'.tr,
        filled: true,

        // fillColor: Color.fromRGBO(244, 244, 244, 1),
        hintStyle: TextStyle(
          color: authTextFromFieldHintTextColor,
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: authTextFromFieldFillColor.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: authTextFromFieldFillColor.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: authTextFromFieldFillColor.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
