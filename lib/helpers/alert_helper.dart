import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:trashflow/themes/index.dart';
import 'package:trashflow/widgets/confirmation_bottomsheet.dart';

enum AlertType { snackBar, dialog }

class AlertHelper {
  static showBottomSheet(Widget content,
      {bool canHide = true, bool disablePadding = false}) async {
    var data = await showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: canHide,
      enableDrag: canHide,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      context: Get.context!,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () => Future.value(false),
            child: Container(
                padding: EdgeInsets.only(
                    top: 16,
                    left: disablePadding
                        ? 0
                        : context.isTablet
                            ? context.isLargeTablet
                                ? Get.width * .25
                                : Get.width * .15
                            : 0,
                    right: disablePadding
                        ? 0
                        : context.isTablet
                            ? context.isLargeTablet
                                ? Get.width * .25
                                : Get.width * .15
                            : 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        85),
                child: content));
      },
    );
    return data;
  }

  static void showAlertError(String? message,
      {String? title, AlertType? alertType, bool canHide = true}) {
    if (message != null) {
      showBottomSheet(
        ConfirmationBottomSheet(
          title: title ?? 'Alert',
          desc: message,
          confirmation: false,
        ),
        canHide: canHide,
      );
    }
  }

  static void showAlertTrigger(String? message) {
    MotionToast.error(
            title: 'Error',
            titleStyle: StyleTheme.headerTs.copyWith(),
            description: message ?? 'Error Trigger',
            descriptionStyle: StyleTheme.textTs.copyWith(),
            width: 300)
        .show(Get.context!);
  }
}
