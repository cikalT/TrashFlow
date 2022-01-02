import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/themes/style_theme.dart';
import 'package:trashflow/widgets/custom_raised_button.dart';

class ErrorBottomSheet extends StatelessWidget {
  final String? title;
  final String? desc;
  final Function()? onTap;
  const ErrorBottomSheet({Key? key, this.title, this.desc, this.onTap})
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
                SvgPicture.asset(
                  'assets/images/comingsoon.svg',
                  height: 180,
                  width: 180,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title ?? 'Terjadi Kesalahan',
                          style: StyleTheme.headerTs,
                        ),
                      ],
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              desc ?? 'Terjadi kesalahan saat memproses, silahkan coba lagi',
              style: const TextStyle(height: 1.2),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: ButtonTheme(
                        height: 50,
                        child: CustomRaisedButton(
                          label: 'OK',
                          onPressed: () {
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
