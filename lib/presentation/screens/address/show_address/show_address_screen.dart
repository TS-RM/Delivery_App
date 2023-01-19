import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tashil_food_app/constants/init/init_boxses.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/address/address_controllers_show.dart';
import 'package:tashil_food_app/core/logic/controllers/checkout_controller.dart';
import 'package:tashil_food_app/data/address/model/address_model.dart';
import 'package:tashil_food_app/presentation/widgets/auth/check_session_user.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';
import 'package:tashil_food_app/routes/screen_name.dart';

class ShowAddress extends StatelessWidget {
  ShowAddress({super.key});
  final addressShowController = Get.find<AddressShowController>();

  final checkoutController = Get.find<CheckoutController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Navigator.of(context).pop();
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        title: Text(
          "Address".tr,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.headlineLarge!.color,
          ),
        ),
        actions: [
          SharedPref.instance.getString('token') == null
              ? const SizedBox()
              : GestureDetector(
                  onTap: () {
                    addressShowController.inRoute
                        ? Get.toNamed(ScreenName.addressInMapScreen,
                            arguments: {'router': true})
                        : Get.toNamed(ScreenName.addressInMapScreen,
                            arguments: {'router': false});
                  },
                  child: Padding(
                    padding: Get.locale?.languageCode == 'en'
                        ? EdgeInsets.only(right: 25.w, left: 0)
                        : EdgeInsets.only(right: 0, left: 25.w),
                    child: Icon(
                      Icons.add_location_sharp,
                      size: 30,
                      color: Theme.of(context).textTheme.headlineLarge!.color,
                    ),
                  ),
                ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              GetBuilder<AddressShowController>(
                builder: (_) => CheckSessionUser(
                  child: addressShowController.isLoading
                      ? Center(
                          child: CircularProgressIndicator(color: mainColor),
                        )
                      : ValueListenableBuilder(
                          valueListenable: Boxes.getAddressData().listenable(),
                          builder: (context, addressModel, child) {
                            if (addressModel.isNotEmpty) {
                              final address = addressModel.values.toList();
                              return SizedBox(
                                width: double.infinity,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: address.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CardShowAddress(
                                      onClick: addressShowController.inRoute
                                          ? () {
                                              addressShowController
                                                  .addAddressInOrder(
                                                      addressShowController
                                                              .allAddressUser[
                                                          index]);
                                              checkoutController
                                                  .updateAddress();
                                              Get.offNamed(
                                                  ScreenName.checkoutScreen);
                                            }
                                          : () {},
                                      addressModel: address[index],
                                    );
                                  },
                                ),
                              );
                            } else {
                              return Center(
                                child: Text(
                                  "You must add an address".tr,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .color!
                                        .withOpacity(.5),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget textShow({
  required String textConst,
  required String textChange,
  required String textChange1,
  required BuildContext context,
}) =>
    TextWithFont().textShow(
      text: textConst + "  -  ".tr + textChange + "  -  ".tr + textChange1,
      fontSize: 18.sp,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).textTheme.headlineLarge!.color,
    );

class CardShowAddress extends StatelessWidget {
  const CardShowAddress(
      {super.key, required this.addressModel, required this.onClick});
  final AddressModel addressModel;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        color: Theme.of(context).secondaryHeaderColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Icon(
              Icons.location_pin,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          title: textShow(
            textConst: addressModel.city.toString(),
            textChange: addressModel.area.toString(),
            textChange1: addressModel.street.toString(),
            context: context,
          ),
          subtitle: TextWithFont().textShow(
            text: addressModel.descAddress.toString(),
            fontSize: 18.sp,
            fontWeight: FontWeight.normal,
            color: Theme.of(context).textTheme.headlineLarge!.color,
          ),
          trailing: IconButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              side: BorderSide.none,
              minimumSize: Size(30.w, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
            ),
            icon: const Icon(Icons.delete),
            color: mainColor,
          ),
        ),
      ),
    );
  }
}
