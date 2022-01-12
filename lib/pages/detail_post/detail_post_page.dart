import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/base/base_widget.dart';
import 'package:trashflow/routes/index.dart';
import 'package:trashflow/themes/index.dart';
import 'package:trashflow/widgets/button_text_style.dart';
import 'package:trashflow/widgets/custom_dropdown.dart';
import 'package:trashflow/widgets/custom_radio_button.dart';
import 'package:trashflow/widgets/custom_raised_button.dart';
import 'package:trashflow/widgets/custom_text_field.dart';

import 'detail_post_controller.dart';

class DetailPostPage extends StatelessWidget {
  const DetailPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPostController>(
      init: DetailPostController(),
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
              label: 'Update Post',
              color: ColorTheme.primaryColor,
              onPressed: () {
                controller.tapUpdatePost();
              },
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
                    'Update Post',
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
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: ColorTheme.primaryColor,
                      ),
                      onPressed: () {
                        controller.tapDeletePost();
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (!controller.isLoading)
                        CustomRadioButton(
                          elevation: 0,
                          padding: 4,
                          unSelectedColor: ColorTheme.newBoxColor,
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
                            controller.printDebugMode(value);
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
                        prefixIcon: Icon(
                          Icons.price_change_outlined,
                          color: ColorTheme.primaryColor,
                        ),
                        filledColor: ColorTheme.newBoxColor,
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
