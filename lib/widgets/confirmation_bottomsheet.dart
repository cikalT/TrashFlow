import 'package:get/get.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/themes/index.dart';
import 'package:trashflow/widgets/custom_raised_button.dart';

class ConfirmationBottomSheet extends StatelessWidget {
  final String? title;
  final String? desc;
  final Function()? onTapYes, onTapNo;
  final bool confirmation;
  final bool isGreen;
  final bool usePrimarySecondary;
  final bool isLoadingAction;
  final String? customIya;
  final String? customNo;
  final BoxDecoration? customDecoration;
  const ConfirmationBottomSheet(
      {Key? key,
      this.title,
      this.desc,
      this.onTapYes,
      this.onTapNo,
      this.customIya,
      this.customNo,
      this.isGreen = false,
      this.usePrimarySecondary = true,
      this.confirmation = true,
      this.isLoadingAction = false,
      this.customDecoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: customDecoration ?? const BoxDecoration(),
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title ?? 'Alert',
                      style: StyleTheme.headerTs,
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Text(
              desc ?? (confirmation ? 'Next?' : 'Error'),
              style: const TextStyle(height: 1.2),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            confirmation
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: CustomRaisedButton(
                                label: customNo ?? 'Cancel',
                                onPressed: onTapNo ??
                                    () {
                                      Get.back(result: false);
                                    },
                              ))),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: isGreen
                                  ? usePrimarySecondary
                                      ? CustomRaisedButton(
                                          loading: isLoadingAction,
                                          label: customIya ?? 'Yes',
                                          onPressed: onTapYes ??
                                              () {
                                                Get.back(result: true);
                                              },
                                        )
                                      : CustomRaisedButton(
                                          color: ColorTheme.primaryColor,
                                          label: customIya ?? 'Yes',
                                          loading: isLoadingAction,
                                          onPressed: onTapYes ??
                                              () {
                                                Get.back(result: true);
                                              },
                                        )
                                  : CustomRaisedButton(
                                      color: ColorTheme.primaryColor,
                                      label: customIya ?? 'Yes',
                                      loading: isLoadingAction,
                                      onPressed: onTapYes ??
                                          () {
                                            Get.back(result: true);
                                          },
                                    )))
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: ButtonTheme(
                              height: 50,
                              child: CustomRaisedButton(
                                label: 'OK',
                                onPressed: onTapYes ??
                                    () {
                                      Get.back(result: true);
                                    },
                              )))
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
