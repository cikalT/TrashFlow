import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trashflow/themes/color_theme.dart';
import 'package:trashflow/themes/style_theme.dart';
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
      switch (alertType) {
        case AlertType.snackBar:
          snackbarError(message, title: title);
          break;
        case AlertType.dialog:
          showBottomSheet(
            ConfirmationBottomSheet(
              title: title ?? 'Alert',
              desc: message,
              confirmation: false,
            ),
            canHide: canHide,
          );
          break;
        default:
          showBottomSheet(ConfirmationBottomSheet(
            title: title ?? 'Alert',
            desc: message,
            confirmation: false,
          ));
          break;
      }
    }
  }

  static void snackbarError(String? message, {String? title}) {
    if (!(Get.isSnackbarOpen) && !(Get.isDialogOpen ?? false)) {
      Get.snackbar(
        title ?? 'Gagal',
        message ?? 'Terjadi kesalahan',
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        // barBlur: 0,
        backgroundColor: Colors.red.withOpacity(.8),
        colorText: Colors.white,
        borderRadius: 20,
        duration: const Duration(seconds: 3),
        icon: const Icon(
          Icons.close_rounded,
          color: Colors.white,
        ),
        shouldIconPulse: true,
      );
    }
  }

  static void snackbarWarning(String? message, {String? title}) {
    if (!(Get.isSnackbarOpen) && !(Get.isDialogOpen ?? false)) {
      Get.snackbar(
        title ?? 'Peringatan',
        message ?? '',
        snackStyle: SnackStyle.FLOATING,
        snackPosition: SnackPosition.TOP,
        // barBlur: 0,
        backgroundColor: ColorTheme.darkYellowColor.withOpacity(0.8),
        colorText: ColorTheme.darkBrownColor,
        borderRadius: 20,
        duration: const Duration(seconds: 4),
        icon: Icon(
          Icons.close_rounded,
          color: ColorTheme.blackColor,
        ),
        shouldIconPulse: true,
      );
    }
  }

  static void snackbar(String? message,
      {String? title, bool isError = false, int? timeout}) {
    if (message != null) {
      if (!(Get.isSnackbarOpen) && !(Get.isDialogOpen ?? false)) {
        Get.snackbar(
          title ?? 'Info',
          message,
          snackStyle: SnackStyle.FLOATING,
          snackPosition: SnackPosition.TOP,
          backgroundColor: isError
              ? Colors.red.withOpacity(.8)
              : Colors.green.withOpacity(.8),
          colorText: Colors.white,
          borderRadius: 20,
          duration: Duration(seconds: timeout ?? 3),
          icon: const Icon(
            Icons.info_outline,
            color: Colors.white,
          ),
          shouldIconPulse: true,
        );
      }
    }
  }

  static Widget actionChooseSheetChild(
      {void Function()? onTap,
      String? iconAssets,
      String? titleName,
      String? desc,
      Color? colorBox}) {
    return Column(children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                child: Container(
                  margin: const EdgeInsets.only(top: 6),
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 8, left: 8, right: 24),
                  child: Row(
                    children: [
                      if (iconAssets != null && colorBox != null)
                        SizedBox(
                          height: 48,
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colorBox,
                                ),
                                width: 48,
                                height: 48,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        iconAssets,
                                        //scale: 5,
                                        height: 23,
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: 48,
                          child: desc != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        titleName ?? '-',
                                        style: StyleTheme.textBoldTs.copyWith(
                                          color: ColorTheme.newFontColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          desc,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: StyleTheme.textTs.copyWith(
                                            color: ColorTheme.greyColor,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          titleName ?? '-',
                                          style:
                                              StyleTheme.subHeaderTs.copyWith(
                                            color: ColorTheme.newFontColor,
                                          ),
                                        ),
                                      )
                                    ]),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: onTap,
              ))),
      // Container(
      //     margin: const EdgeInsets.only(left: 72, top: 8),
      //     child: CustomSeparatorSection(height: 1)),
      const SizedBox(
        height: 24,
      ),
    ]);
  }
}
