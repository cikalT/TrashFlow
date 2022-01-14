import 'package:get/get.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/routes/index.dart';
import 'package:trashflow/themes/index.dart';
import 'package:trashflow/widgets/button_text_style.dart';
import 'package:trashflow/widgets/custom_dropdown.dart';
import 'package:trashflow/widgets/custom_radio_button.dart';
import 'package:trashflow/widgets/custom_text_field.dart';

import '../detail_post_controller.dart';

class AuthorSection extends StatelessWidget {
  const AuthorSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPostController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (!controller.isLoading)
              CustomRadioButton(
                elevation: 0,
                padding: 4,
                unSelectedColor: ColorTheme.boxColor,
                buttonLables: const [
                  'Sell',
                  'Buy',
                ],
                buttonValues: const [
                  "sell",
                  "buy",
                ],
                radius: 12,
                shapeRadius: 12,
                selectedBorderColor: Colors.transparent,
                unSelectedBorderColor: Colors.transparent,
                buttonTextStyle: ButtonTextStyle(
                  selectedColor: ColorTheme.whiteColor,
                  unSelectedColor: ColorTheme.primaryColor,
                  textStyle: const TextStyle(fontSize: 16),
                ),
                radioButtonValue: (value) {
                  controller.postType = value.toString().toUpperCase();
                },
                selectedColor: ColorTheme.primaryColor,
                defaultSelected: controller.postType,
              ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              controller: controller.fieldPostTitle,
              hintText: 'Title',
              filledColor: ColorTheme.boxColor,
              labelColor: ColorTheme.primaryColor,
              filledTextColor: ColorTheme.primaryColor,
              borderedMode: false,
              transparencyMode: true,
              maxLines: 1,
              keyboardType: TextInputType.text,
            ),
            CustomDropdown<int>(
                child: Text(controller.categoryText,
                    style: StyleTheme.textTs.copyWith(
                      color: ColorTheme.primaryColor,
                      fontWeight: FontWeight.w400,
                    )),
                onChange: (value, index) {
                  controller.categoryText =
                      controller.postCategoryList[index!]!.name.toString();
                  controller.categoryId =
                      controller.postCategoryList[index]!.id.toString();
                  controller.update();
                },
                dropdownButtonStyle: DropdownButtonStyle(
                  height: 48,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  width: double.infinity,
                  backgroundColor: ColorTheme.boxColor,
                ),
                dropdownStyle: DropdownStyle(
                  borderRadius: BorderRadius.circular(8),
                  padding: const EdgeInsets.all(5),
                  color: ColorTheme.boxColor,
                ),
                items: controller.postCategoryList
                    .asMap()
                    .entries
                    .map(
                      (item) => DropdownItem<int>(
                        value: item.key + 1,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            item.value?.name ?? '',
                            style: StyleTheme.textTs.copyWith(
                                color: ColorTheme.primaryColor, fontSize: 14),
                          ),
                        ),
                      ),
                    )
                    .toList()),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              controller: controller.fieldPostDescription,
              hintText: 'Description',
              filledColor: ColorTheme.boxColor,
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
              prefixIcon: Icon(
                Icons.price_change_outlined,
                color: ColorTheme.primaryColor,
              ),
              filledColor: ColorTheme.boxColor,
              labelColor: ColorTheme.primaryColor,
              filledTextColor: ColorTheme.primaryColor,
              borderedMode: false,
              transparencyMode: true,
              maxLines: 1,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 64,
            )
          ],
        ),
      ),
    );
  }
}
