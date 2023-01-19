// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:tashil_food_app/constants/theme/theme_data.dart';
// import 'package:tashil_food_app/core/logic/controllers/profile_setting.dart';
// import 'package:tashil_food_app/core/logic/controllers/settings_controller.dart';
 /// ! delete
// class FirstRowWithText extends StatelessWidget {
//   FirstRowWithText({
//     Key? key,
//     required this.nameController,
//     required this.name,
//   }) : super(key: key);

//   final TextEditingController nameController;
//   final controller = Get.find<ProfileSettingController>();
//   final settingController = Get.find<SettingsController>();

//   final FocusNode inputNode = FocusNode();
//   final String Text;

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Row(
//         children: [
//           const Icon(
//             Icons.person_outline,
//           ),
//           SizedBox(
//             width: 20.w,
//           ),
//           Text(
//             name
//           ),
//           SizedBox(
//             width: 150,
//             child: TextField(
//               enabled: controller.firstEnabled.value,
//               controller: nameController..text = name,
//               cursorColor: Colors.black,
//               keyboardType: TextInputType.text,
//               // validator: (value) {},
//               style: TextStyle(
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.w500,
//                   color: Theme.of(context).textTheme.headlineLarge!.color),

//               onChanged: (value) {
//                 settingController.firstNameFromText.value = value;
//                 print(settingController.firstNameFromText.value);
//               },
//               decoration: InputDecoration(
//                 contentPadding:
//                     const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
//                 fillColor: Theme.of(context).secondaryHeaderColor,
//                 hintStyle: TextStyle(
//                   fontSize: 17.sp,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 filled: true,
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: controller.firstEnabled.value
//                         ? Colors.black
//                         : Colors.white,
//                   ),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide:
//                       const BorderSide(color: authTextFromFieldPonderColor),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//           ),
//           // Padding(
//           //   padding: EdgeInsets.only(left: 50.w),
//           //   child: GestureDetector(
//           //     onTap: () {
//           //       controller.firstChangeEnabled();
//           //       print(controller.firstEnabled.value);
//           //     },
//           //     child: const Icon(
//           //       Icons.mode_edit_outline_outlined,
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }

// class LastRowWithText extends StatelessWidget {
//   LastRowWithText({
//     Key? key,
//     required this.nameController,
//     required this.name,
//   }) : super(key: key);

//   final TextEditingController nameController;
//   final controller = Get.find<ProfileSettingController>();
//   final settingController = Get.find<SettingsController>();

//   final FocusNode inputNode = FocusNode();
//   final String name;

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Row(
//         children: [
//           const Icon(
//             Icons.person_outline,
//           ),
//           SizedBox(
//             width: 20.w,
//           ),
//           SizedBox(
//             width: 150,
//             child: TextField(
//               enabled: controller.lastEnabled.value,
//               controller: nameController..text = name,
//               cursorColor: Colors.black,
//               keyboardType: TextInputType.text,
//               // validator: (value) {},
//               style: TextStyle(
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w500,
//                   color: Theme.of(context).textTheme.headlineLarge!.color),

//               onChanged: (value) {
//                 settingController.lastNameFromText.value = value;
//                 print(settingController.lastNameFromText.value);
//               },
//               decoration: InputDecoration(
//                 contentPadding:
//                     const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
//                 fillColor: Theme.of(context).secondaryHeaderColor,
//                 hintStyle: TextStyle(
//                   fontSize: 17.sp,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 filled: true,
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                     color: controller.lastEnabled.value
//                         ? Colors.black
//                         : Colors.white,
//                   ),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide:
//                       const BorderSide(color: authTextFromFieldPonderColor),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//           ),
//           // Padding(
//           //   padding: EdgeInsets.only(left: 50.w),
//           //   child: GestureDetector(
//           //     onTap: () {
//           //       controller.lastChangeEnabled();
//           //       print(controller.lastEnabled.value);
//           //     },
//           //     child: const Icon(
//           //       Icons.mode_edit_outline_outlined,
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
