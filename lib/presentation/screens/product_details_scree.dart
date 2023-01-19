import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/data/auth/service/hive_auth_controllers.dart';
import 'package:tashil_food_app/core/logic/controllers/cart_controllers.dart';
import 'package:tashil_food_app/core/logic/controllers/favorites_conntroller.dart';
import 'package:tashil_food_app/core/logic/controllers/meal_details_controller.dart';
import 'package:tashil_food_app/presentation/widgets/auth/auth_button.dart';
import 'package:tashil_food_app/presentation/widgets/get_snackbar.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

import '../widgets/productDetails/back_icon.dart';
import '../widgets/productDetails/description.dart';
import '../widgets/productDetails/description_text.dart';
import '../widgets/productDetails/image_shadow.dart';
import '../widgets/productDetails/item_counter.dart';
import '../widgets/productDetails/rating_bar_rev.dart';
import '../widgets/productDetails/review_product.dart';
import '../widgets/productDetails/see_more.dart';
import '../widgets/productDetails/show_image.dart';
import '../widgets/productDetails/sub_title.dart';
import '../widgets/productDetails/title_text.dart';

class ProductDetailsScreen extends GetView<MealDetailsController> {
  ProductDetailsScreen({Key? key}) : super(key: key);

  final favoriteController = Get.find<FavoritesController>();
  final cartController = Get.find<CartController>();

  chick() {
    print('done1');

    String name = controller.mealsData.value.name!;
    String image = controller.mealsData.value.image!;
    int price = controller.mealsData.value.price!;
    String id = controller.mealsData.value.id!;

    cartController.addProductToCart(
      quantity: controller.counter.value,
      mealId: id,
      price: price,
      name: name,
      image: image,
    );

    print('done2');
  }

  Future<void> _refreshLocalGallery() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      RefreshIndicator(
        onRefresh: _refreshLocalGallery,
        child: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(children: [
                  Stack(
                    children: [
                      Stack(
                        children: [
                          ShowImage(
                            imageUrl: controller.mealsData.value.image!,
                          ),
                          const ImageShadow(),
                        ],
                      ),
                      SafeArea(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            const BackIcon(),
                            SizedBox(
                              height: ScreenUtil().screenHeight * 0.35,
                            ),
                            SizedBox(
                              height: ScreenUtil().screenHeight * .573,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Container(
                                      height: 700,
                                      width: double.infinity,
                                      padding: const EdgeInsets.only(top: 30),
                                      decoration: ShapeDecoration(
                                        color: Theme.of(context).cardColor,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(40),
                                            topRight: Radius.circular(40),
                                          ),
                                        ),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TitleText(
                                              title: controller
                                                  .mealsData.value.name!,
                                            ),
                                            SupTitle(
                                              supTitle: controller
                                                  .mealsData.value.category!,
                                              cal: controller
                                                  .mealsData.value.calories
                                                  .toString(),
                                              price: controller
                                                  .mealsData.value.price
                                                  .toString(),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),

                                            const ReviewProduct(),

                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Row(
                                                children: [
                                                  RatingBarRev(
                                                    rating: controller
                                                        .mealsData.value.rating!
                                                        .toDouble(),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  TextWithFont().textShow(
                                                      color: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .color!,
                                                      fontSize: 12.sp,
                                                      text:
                                                          '(${controller.mealsData.value.rating}) ${3} ',
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  const SizedBox(
                                                    width: 3,
                                                  ),
                                                  Text(
                                                    "Review".tr,
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .color!,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        GestureDetector(
                                                            onTap: () {
                                                              Get.toNamed(
                                                                  ScreenName
                                                                      .allReviewScreen,
                                                                  arguments: {
                                                                    'productId':
                                                                        controller
                                                                            .mealsData
                                                                            .value
                                                                            .id
                                                                  });
                                                            },
                                                            child:
                                                                const SeeMore()),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            // "Description",
                                            SizedBox(
                                              height: 20.h,
                                            ),

                                            const Description(),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            DescriptionText(
                                              decoration: controller
                                                  .mealsData.value.description!,
                                            ),

                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Divider(
                                                color: Colors.grey.shade400,
                                                thickness: 1.5,
                                              ),
                                            ),

                                            ItemCounter(
                                              mealDetailsController: controller,
                                            ),

                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            GetBuilder<CartController>(
                                              builder: (_) => Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: AuthButton(
                                                  press: SharedPref.instance
                                                              .getString(
                                                                  'token') ==
                                                          null
                                                      ? () {
                                                          Get.toNamed(ScreenName
                                                              .loginScreen);
                                                          getSnackbar(
                                                              supTitle:
                                                                  'You must login with account'.tr,
                                                              title: "Note".tr);
                                                        }
                                                      : () => chick(),
                                                  text: 'Add to Cart'.tr,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      SharedPref.instance.getString("token") != null
                                        ? favoriteController.mangeFavorites(
                                          controller.mealsData.value)
                                        : getSnackbar(
                                            title: "Error".tr,
                                            supTitle: "You must login with account".tr,
                                          );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 20,
                                      ),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          width: 60.w,
                                          height: 60.h,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(context).cardColor,
                                          ),
                                          child: SharedPref.instance.getString("token") != null
                                            ? favoriteController.isFavorites(
                                                  controller.mealsData.value,
                                                  controller
                                                      .mealsData.value.id!)
                                              ? Icon(
                                                  Icons.favorite,
                                                  color: mainColor,
                                                )
                                              : Icon(
                                                  Icons.favorite_border,
                                                  color: mainColor,
                                                )
                                            : Icon(
                                                Icons.favorite_border,
                                                color: mainColor,
                                              )
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
        ),
      )
    ]));
  }
}
