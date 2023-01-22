import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/static_data/shared_preference.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/address/address_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tashil_food_app/presentation/widgets/auth/auth_button.dart';

import 'package:tashil_food_app/routes/screen_name.dart';

class AddressInMapScreen extends StatelessWidget {
  AddressInMapScreen({Key? key}) : super(key: key);
  final addressController = Get.find<AddressController>();
  // final checkoutController = Get.find<CheckoutController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAndToNamed(ScreenName.showAddress,
            arguments: {'inRoute': false});
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          // actions: [
          // GetBuilder<AddressController>(builder: (_) {
          //   return TextButton(
          //     onPressed: () async {
          //       await addressController.saveAddres();
          //       await checkoutController.updateaddress();

          //       print('*********');

          //       print(await SharedPref.instance.getString("currentAddress"));
          //     },
          //     child: TextWithFont().textWithRobotoFont(
          //         color: mainColor,
          //         fontSize: 18.sp,
          //         text: 'Save',
          //         fontWeight: FontWeight.normal),
          //   );
          // }),
          // ],
          leading: IconButton(
            onPressed: () {
              Get.offAndToNamed(ScreenName.showAddress,
                  arguments: {'inRoute': false});
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
            ),
          ),
          title: Text(
            "Add Address".tr,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.headlineLarge!.color,
            ),
          ),
        ),
        body: Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  GetBuilder<AddressController>(builder: (_) {
                    return Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: addressController.latLng == null
                              ? Center(
                                  child: CircularProgressIndicator(
                                  color: mainColor,
                                ))
                              : GoogleMap(
                                  mapType: MapType.normal,
                                  initialCameraPosition:
                                      addressController.cameraPosition!,
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    addressController.controller = (controller);
                                    addressController.controller?.animateCamera(
                                        CameraUpdate.newCameraPosition(
                                            addressController.cameraPosition!));
                                  },
                                  markers: addressController.markers,
                                ),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  // SearchBar(title: "Search Address"),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         height: 50,
                  //         width: 50,
                  //         decoration: ShapeDecoration(
                  //           shape: const CircleBorder(),
                  //           color: Colors.orange.withOpacity(0.2),
                  //         ),
                  //         child: const Icon(
                  //           Icons.star_rounded,
                  //           color: Colors.orange,
                  //           size: 30,
                  //         ),
                  //       ),
                  //       const SizedBox(
                  //         width: 10,
                  //       ),
                  //       Expanded(
                  //         child: Text(
                  //           "Choose a saved place",
                  //           style: TextStyle(
                  //             color: mainColor,
                  //           ),
                  //         ),
                  //       ),
                  //       IconButton(
                  //         icon: const Icon(Icons.arrow_forward_ios_rounded),
                  //         onPressed: () {
                  //           Get.toNamed(ScreenName.writeAddressScreen);
                  //         },
                  //       )
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder<AddressController>(builder: (_) {
                    return Visibility(
                      visible: addressController.address != null ? true : false,
                      child: AuthButton(
                        press: () async {
                          await addressController.saveAddress();
                          // await checkoutController.updateAddress();

                          print('*********');

                          print(await SharedPref.instance
                              .getString("currentAddress"));
                          Get.offAndToNamed(ScreenName.writeAddressScreen);
                        },
                        text: 'أضافة بيانات موقعك'.tr,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class CustomTriangleClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path()
//       ..moveTo(0, size.height)
//       ..lineTo(size.width, 0)
//       ..lineTo(size.width, size.height)
//       ..lineTo(0, size.height);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }
