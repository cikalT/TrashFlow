import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/base/base_widget.dart';
import 'package:trashflow/themes/index.dart';
import 'package:trashflow/widgets/button_text_style.dart';
import 'package:trashflow/widgets/custom_radio_button.dart';
import 'package:trashflow/widgets/custom_raised_button.dart';
import 'package:trashflow/widgets/custom_text_field.dart';

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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    CustomRadioButton(
                      elevation: 0,
                      padding: 4,
                      unSelectedColor: ColorTheme.newBoxColor,
                      buttonLables: const [
                        'Sell',
                        'Buy',
                      ],
                      buttonValues: const [
                        "SELL",
                        "ACCEPT_SELLING",
                      ],
                      radius: 12,
                      shapeRadius: 12,
                      selectedBorderColor: Colors.transparent,
                      unSelectedBorderColor: Colors.transparent,
                      buttonTextStyle: const ButtonTextStyle(
                        selectedColor: Colors.white,
                        unSelectedColor: Colors.black,
                        textStyle: TextStyle(fontSize: 16),
                      ),
                      radioButtonValue: (value) {},
                      selectedColor: ColorTheme.primaryColor,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      controller: controller.fieldPostTitle,
                      hintText: 'Title',
                      filledColor: ColorTheme.newBoxColor,
                      labelColor: ColorTheme.primaryColor,
                      filledTextColor: ColorTheme.primaryColor,
                      borderedMode: false,
                      transparencyMode: true,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                    ),
                    CustomTextField(
                      controller: controller.fieldPostTitle,
                      hintText: 'Category',
                      filledColor: ColorTheme.newBoxColor,
                      labelColor: ColorTheme.primaryColor,
                      filledTextColor: ColorTheme.primaryColor,
                      borderedMode: false,
                      transparencyMode: true,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                    ),
                    CustomTextField(
                      controller: controller.fieldPostDescription,
                      hintText: 'Description',
                      filledColor: ColorTheme.newBoxColor,
                      labelColor: ColorTheme.primaryColor,
                      filledTextColor: ColorTheme.primaryColor,
                      borderedMode: false,
                      transparencyMode: true,
                      minLines: 6,
                      maxLines: 6,
                    ),
                    CustomTextField(
                      controller: controller.fieldPostPrice,
                      hintText: 'Price',
                      prefixIcon: const Icon(Icons.price_change_outlined),
                      filledColor: ColorTheme.newBoxColor,
                      labelColor: ColorTheme.primaryColor,
                      filledTextColor: ColorTheme.primaryColor,
                      borderedMode: false,
                      transparencyMode: true,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                    ),
                    CustomRaisedButton(
                      radius: 8,
                      padding: const EdgeInsets.all(12),
                      textStyle: StyleTheme.textTs
                          .copyWith(color: ColorTheme.newFontHeaderColor),
                      label: 'Upload Photo',
                      color: ColorTheme.newBoxColor,
                      onPressed: () {},
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: CustomRaisedButton(
                        radius: 16,
                        padding: const EdgeInsets.all(12),
                        textStyle: StyleTheme.textBoldTs.copyWith(
                            color: ColorTheme.whiteColor, fontSize: 16),
                        label: 'Update Profile & Location',
                        color: ColorTheme.primaryColor,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 32,
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
