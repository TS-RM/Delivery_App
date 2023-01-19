import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/core/logic/controllers/settings_controller.dart';

class ViewImage extends StatelessWidget {
  ViewImage({
    Key? key,
    required this.editable,
  }) : super(key: key);
  final settingController = Get.find<SettingsController>();
  final bool editable;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
        builder: (_) => Align(
              alignment: Alignment.center,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 60,
                    child: settingController.loading
                        ? const CircularProgressIndicator()
                        : ClipOval(
                            child: settingController.file.path != ''
                                ? Image.file(
                                    settingController.file,
                                    height: 150.0.h,
                                    width: 150.w,
                                    fit: BoxFit.fill,
                                  )
                                : settingController.image.value == 'null'
                                    ? Image.asset(
                                        'assets/images/icons/person.png',
                                        fit: BoxFit.cover,
                                      )
                                    : CachedNetworkImage(
                                        imageUrl: settingController.image.value,
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(
                                          Icons.person,
                                          color: Colors.grey.shade700,
                                          size: 100,
                                        ),
                                        width: 150.w,
                                        height: 150.h,
                                        fit: BoxFit.cover,
                                      ),
                          ),
                  ),
                  editable == true
                      ? Positioned(
                          top: 105.h,
                          right: 0.w,
                          child: GestureDetector(
                            onTap: () {
                              settingController.choose();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).secondaryHeaderColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context)
                                          .shadowColor
                                          .withOpacity(.2),
                                      offset: const Offset(0, 0),
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                      blurStyle: BlurStyle.outer),
                                ],
                              ),
                              width: 35.w,
                              height: 35.h,
                              child: Icon(
                                Icons.mode_edit_outline_outlined,
                                color: mainColor,
                                size: 20,
                              ),
                            ),
                          ),
                        )
                      : const Text(""),
                ],
              ),
            ));
  }
}
