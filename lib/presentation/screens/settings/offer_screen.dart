import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/enums/loading_types.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/offer_controller.dart';
import 'package:tashil_food_app/core/helper/handling_data_view.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

import '../../widgets/offer/offer_search.dart';
import '../../widgets/search/filter_container.dart';
import '../../widgets/settings/offer/app_bar_offer.dart';

class OfferScreen extends StatelessWidget {
  final offerController = Get.put(OfferController());

  OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarOffer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 60.h,
              child: Row(
                children: [
                  const Expanded(
                    child: OfferSearch(),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  const FilterContainer(),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: double.infinity,
              height: Get.height * .79,
              child: Obx(() {
                final loadingType =
                    offerController.loadingState.value.loadingType;

                return GetBuilder<OfferController>(builder: (_) {
                  return HandlingDataView(
                    statusRequest: offerController.statusOffer,
                    widget: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        controller: offerController.scrollController,
                        itemCount: loadingType == LoadingType.loading ||
                                loadingType == LoadingType.error ||
                                loadingType == LoadingType.completed
                            ? offerController.offerList.length + 1
                            : offerController.offerList.length,
                        itemBuilder: (context, index) {
                          final isLastItem =
                              index == offerController.offerList.length;
                          if (isLastItem &&
                              loadingType == LoadingType.loading) {
                            return const Center(
                                child: CircularProgressIndicator.adaptive());
                          } else if (isLastItem &&
                              loadingType == LoadingType.error) {
                            return Container();
                          } else if (isLastItem &&
                              loadingType == LoadingType.completed) {
                            return Text(
                              offerController.loadingState.value.completed
                                  .toString(),
                            );
                          } else {
                            return Card(
                              elevation: 4,
                              // shadowColor: Colors.black45,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 30,
                                        child: ClipOval(
                                          child: CachedNetworkImage(
                                            imageUrl: offerController
                                                .offerList[index]
                                                .dataMeals!
                                                .image!,
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(
                                              Icons.error,
                                            ),
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      title: SizedBox(
                                        width: 50,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextWithFont().textShow(
                                                text: offerController
                                                    .offerList[index].title!,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge!
                                                    .color),
                                            TextWithFont().textShow(
                                                text: offerController
                                                    .offerList[index].deadline!
                                                    .substring(0, 10),
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge!
                                                    .color!
                                                    .withOpacity(.5)),
                                          ],
                                        ),
                                      ),
                                      subtitle: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: mainColor,
                                          ),
                                          TextWithFont().textShow(
                                              text: offerController
                                                  .offerList[index]
                                                  .dataMeals!
                                                  .rating!
                                                  .toString(),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .color!
                                                  .withOpacity(.5)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Align(
                                        alignment: const Alignment(0.7, -0.5),
                                        child: Stack(children: [
                                          SvgPicture.asset(
                                              'assets/images/icons/offer.svg'),
                                          Padding(
                                            padding: EdgeInsets.only(top: 15.h),
                                            child: TextWithFont().textShow(
                                                text:
                                                    '%${offerController.offerList[index].discountPercent}',
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ]),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
                        }),
                  );
                });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
