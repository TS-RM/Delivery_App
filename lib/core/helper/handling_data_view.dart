import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:tashil_food_app/constants/theme/theme_data.dart';
import 'package:tashil_food_app/constants/enums/status_request.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? SizedBox(
            height: 120,
            child: Center(
              child: CircularProgressIndicator(color: mainColor),
            ),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? SizedBox(
                height: 120,
                child: Center(
                    child: Text(
                  "Offline Failure".tr,
                  style: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .color!
                        .withOpacity(.5),
                  ),
                )),
              )
            : statusRequest == StatusRequest.serverFailure
                ? SizedBox(
                    height: 120,
                    child: Center(
                        child: Text(
                      "Server Failure".tr,
                      style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .color!
                            .withOpacity(.5),
                      ),
                    )),
                  )
                : statusRequest == StatusRequest.failure
                    ? SizedBox(
                        height: 120,
                        child: Center(
                            child: Text(
                          "No Data".tr,
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .color!
                                .withOpacity(.5),
                          ),
                        )),
                      )
                    : widget;
  }
}
