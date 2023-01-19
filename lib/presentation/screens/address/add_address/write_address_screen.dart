import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/address/address_controllers.dart';
import 'package:tashil_food_app/presentation/widgets/auth/auth_button.dart';
import 'package:tashil_food_app/presentation/widgets/text_field/text_form_field.dart';
import 'package:tashil_food_app/presentation/widgets/text_with_font.dart';

class WriteAddressScreen extends StatelessWidget {
  WriteAddressScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController addressTypeController = TextEditingController();
  final TextEditingController nearByController = TextEditingController();
  final TextEditingController descAddressController = TextEditingController();

  final addressController = Get.find<AddressController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  "أدخل بيانات الموقع الذي تريد توصيل الطلب له",
                  style: TextStyle(
                    color: mainColor,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFromFieldApp(
                  controller: cityController,
                  obscureText: false,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'this field is required, please fill it out'.tr;
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: const Icon(
                    Icons.location_city_rounded,
                    size: 24,
                    color: authTextFromFieldHintTextColor,
                  ),
                  suffixIcon: const Text(""),
                  hintText: 'City'.tr,
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFromFieldApp(
                  controller: areaController,
                  obscureText: false,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'this field is required, please fill it out'.tr;
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: const Icon(
                    Icons.directions_rounded,
                    size: 24,
                    color: authTextFromFieldHintTextColor,
                  ),
                  suffixIcon: const Text(""),
                  hintText: 'المنطقة'.tr,
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFromFieldApp(
                  controller: streetController,
                  obscureText: false,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'this field is required, please fill it out'.tr;
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: const Icon(
                    Icons.directions_rounded,
                    size: 24,
                    color: authTextFromFieldHintTextColor,
                  ),
                  suffixIcon: const Text(""),
                  hintText: 'الشارع'.tr,
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFromFieldApp(
                  controller: addressTypeController,
                  obscureText: false,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'this field is required, please fill it out'.tr;
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: const Icon(
                    Icons.location_history,
                    size: 24,
                    color: authTextFromFieldHintTextColor,
                  ),
                  suffixIcon: const Text(""),
                  hintText: 'نوع العنوان : مكتب - منزل  - محل'.tr,
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFromFieldApp(
                  controller: nearByController,
                  obscureText: false,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'this field is required, please fill it out'.tr;
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: const Icon(
                    Icons.directions_rounded,
                    size: 24,
                    color: authTextFromFieldHintTextColor,
                  ),
                  suffixIcon: const Text(""),
                  hintText: 'بجوار : مطعم مشاوي '.tr,
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFromFieldApp(
                  controller: descAddressController,
                  obscureText: false,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'this field is required, please fill it out'.tr;
                    } else {
                      return null;
                    }
                  },
                  prefixIcon: const Icon(
                    Icons.location_on,
                    size: 24,
                    color: authTextFromFieldHintTextColor,
                  ),
                  suffixIcon: const Text(""),
                  hintText: 'وصف العنوان'.tr,
                  maxLines: 1,
                  contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(
                  height: 15.h,
                ),
                GetBuilder<AddressController>(
                  builder: (_) => addressController.isLoading
                      ? const CircularProgressIndicator()
                      : Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: AuthButton(
                            text: 'حفظ الموقع'.tr,
                            press: () {
                              final isValid = formKey.currentState!.validate();
                              if (isValid) {
                                addressController.addAddress(
                                    city: cityController.text.trim(),
                                    area: areaController.text.trim(),
                                    street: streetController.text.trim(),
                                    addressType:
                                        addressTypeController.text.trim(),
                                    nearby: nearByController.text.trim(),
                                    descAddress:
                                        descAddressController.text.trim(),
                                    addressInMap: addressController.address);
                              } else {
                                print(addressController.address);
                              }
                            },
                          ),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
