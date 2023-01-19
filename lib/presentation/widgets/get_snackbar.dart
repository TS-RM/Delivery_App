import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController getSnackbar(
    {required String title, required String supTitle}) {
  return Get.snackbar(
    title,
    supTitle,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.grey.shade300,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    colorText: Colors.black,
    duration: const Duration(seconds: 4),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
