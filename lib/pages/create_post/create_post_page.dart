import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/base/base_widget.dart';
import 'package:trashflow/models/index.dart';
import 'package:trashflow/routes/index.dart';
import 'package:trashflow/themes/index.dart';
import 'package:trashflow/widgets/button_text_style.dart';
import 'package:trashflow/widgets/custom_dropdown.dart';
import 'package:trashflow/widgets/custom_radio_button.dart';
import 'package:trashflow/widgets/custom_raised_button.dart';
import 'package:trashflow/widgets/custom_text_field.dart';

import 'create_post_controller.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreatePostController>(
      init: CreatePostController(),
      builder: (controller) => BaseWidget(
        controller: controller,
        isLoading: controller.isLoading,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorTheme.primaryColor,
          toolbarHeight: 0,
        ),
        bottomNavigationBar: Transform.translate(
          offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: CustomRaisedButton(
              radius: 16,
              padding: const EdgeInsets.all(12),
              textStyle: StyleTheme.textBoldTs
                  .copyWith(color: ColorTheme.whiteColor, fontSize: 16),
              label: 'Create Post',
              color: ColorTheme.primaryColor,
              onPressed: () {},
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
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
                  leading: IconButton(
                    splashRadius: 16,
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back,
                      color: ColorTheme.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SingleChildScrollView(
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
                        buttonTextStyle: ButtonTextStyle(
                          selectedColor: ColorTheme.whiteColor,
                          unSelectedColor: ColorTheme.primaryColor,
                          textStyle: const TextStyle(fontSize: 16),
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
                      CustomDropdown<int>(
                          child: Text(controller.categoryText,
                              style: StyleTheme.textTs.copyWith(
                                color: ColorTheme.primaryColor,
                                fontWeight: FontWeight.w400,
                              )),
                          onChange: (value, index) {
                            controller.categoryText = controller
                                .postCategoryList[index!]!.name
                                .toString();
                            controller.categoryId = controller
                                .postCategoryList[index]!.id
                                .toString();
                            controller.update();
                          },
                          dropdownButtonStyle: DropdownButtonStyle(
                            height: 48,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            width: double.infinity,
                            backgroundColor: ColorTheme.newBoxColor,
                          ),
                          dropdownStyle: DropdownStyle(
                            borderRadius: BorderRadius.circular(8),
                            padding: const EdgeInsets.all(5),
                            color: ColorTheme.newBoxColor,
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
                                          color: ColorTheme.primaryColor,
                                          fontSize: 14),
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
                        onPressed: () {
                          controller.tapUploadPhoto();
                        },
                      ),
                      const SizedBox(
                        height: 64,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
