import 'package:get/get.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/models/index.dart';
import 'package:trashflow/routes/index.dart';
import 'package:trashflow/themes/index.dart';
import 'package:trashflow/widgets/custom_raised_button.dart';

import '../home_controller.dart';

class AddPostSection extends StatelessWidget {
  const AddPostSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        color: ColorTheme.newBoxColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: ColorTheme.whiteColor,
              title: Text(
                'Create Post',
                style: StyleTheme.textBoldTs
                    .copyWith(color: ColorTheme.primaryColor, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.2,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorTheme.whiteColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 80,
                        child: CustomRaisedButton(
                          radius: 16,
                          padding: const EdgeInsets.all(12),
                          textStyle: StyleTheme.textBoldTs.copyWith(
                              color: ColorTheme.whiteColor, fontSize: 16),
                          label: 'Look for Trash',
                          color: ColorTheme.primaryColor,
                          onPressed: () {
                            controller.tapCreatePost('buy');
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 80,
                        child: CustomRaisedButton(
                          radius: 16,
                          padding: const EdgeInsets.all(12),
                          textStyle: StyleTheme.textBoldTs.copyWith(
                              color: ColorTheme.whiteColor, fontSize: 16),
                          label: 'Sell some Trash',
                          color: ColorTheme.primaryColor,
                          onPressed: () {
                            controller.tapCreatePost('sell');
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
