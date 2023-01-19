import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tashil_food_app/data/category/model/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
          image: CachedNetworkImageProvider(
            categoryModel.logo!,
          ),
          // (
          //   homeRestaurantsData.logo!,
          // ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Text(
          categoryModel.name!,
          maxLines: 2,
          style: TextStyle(
            color: Colors.white.withOpacity(1),
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );

    // CachedNetworkImage(
    //   imageUrl: homeRestaurantsData.logo!,
    //   imageBuilder: (context, imageProvider) => Container(
    //     margin: EdgeInsets.all(5),
    //     width: 110,
    //     alignment: Alignment.center,
    //     decoration: BoxDecoration(
    //       image: DecorationImage(
    //         colorFilter: ColorFilter.mode(
    //             Colors.black.withOpacity(0.3), BlendMode.darken),
    //         image: CachedNetworkImageProvider(
    //           homeRestaurantsData.logo!,
    //         ),
    //         fit: BoxFit.cover,
    //       ),
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     child: Padding(
    //       padding:
    //           EdgeInsets.only(right: 5.w, bottom: 0, left: 10.w, top: 55.h),
    //       child: Text(
    //         homeRestaurantsData.name!,
    //         maxLines: 1,
    //         style: GoogleFonts.roboto(
    //           textStyle: TextStyle(
    //             color: Colors.white.withOpacity(1),
    //             fontSize: 16,
    //             fontWeight: FontWeight.w800,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
