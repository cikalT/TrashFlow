import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/themes/style_theme.dart';
import 'package:trashflow/widgets/custom_outline_button.dart';
import 'package:trashflow/widgets/custom_raised_button.dart';

class ConfirmationBottomSheet extends StatelessWidget {
  final String? title;
  final String? desc;
  final Function()? onTapYes, onTapNo;
  final bool confirmation;
  final bool isGreen;
  final bool usePrimarySecondary;
  final bool isLoadingAction;
  final String? imagePath;
  final String? customIya;
  final String? customNo;
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
      this.imagePath,
      this.isLoadingAction = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                if (imagePath != null)
                  Column(
                    children: [
                      SvgPicture.asset(
                        imagePath!,
                        height: 180,
                        width: 180,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
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
                        // Text('MOHON BAGIAN INI DIBACA SAMPAI SELESAI',style: StyleTheme.textTs.copyWith(color: ColorTheme.greyColor),),
                      ],
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              desc ??
                  (confirmation
                      ? 'Yakin ingin melanjutkan?'
                      : 'Terjadi kesalahan'),
              style: const TextStyle(height: 1.2),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            // CustomSeparatorSection(
            //   height: 1,
            // ),
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
                              child: isGreen
                                  ? usePrimarySecondary
                                      ? CustomOutlineButton(
                                          label: customNo ?? 'Batal',
                                          onPressed: onTapNo ??
                                              () {
                                                Get.back(result: false);
                                              },
                                        )
                                      : CustomRaisedButton(
                                          label: customNo ?? 'Batal',
                                          onPressed: onTapNo ??
                                              () {
                                                Get.back(result: false);
                                              },
                                        )
                                  : CustomRaisedButton(
                                      label: customNo ?? 'Batal',
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
                                          label: customIya ?? 'Iya',
                                          onPressed: onTapYes ??
                                              () {
                                                Get.back(result: true);
                                              },
                                        )
                                      : CustomRaisedButton(
                                          color: Colors.green,
                                          label: customIya ?? 'Iya',
                                          loading: isLoadingAction,
                                          onPressed: onTapYes ??
                                              () {
                                                Get.back(result: true);
                                              },
                                        )
                                  : CustomRaisedButton(
                                      color: Colors.red,
                                      label: customIya ?? 'Iya',
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
                                label: 'OKE',
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
