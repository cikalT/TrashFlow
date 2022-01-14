import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/base/base_widget.dart';
import 'package:trashflow/routes/index.dart';
import 'package:trashflow/themes/index.dart';
import 'package:trashflow/widgets/custom_raised_button.dart';
import 'package:trashflow/widgets/custom_text_field.dart';

import 'edit_profile_controller.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
      init: EditProfileController(),
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
              label: 'Update Profile & Location',
              color: ColorTheme.primaryColor,
              onPressed: () {
                controller.tapUpdate();
              },
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                elevation: 0,
                centerTitle: true,
                backgroundColor: ColorTheme.whiteColor,
                title: Text(
                  'Edit Profile',
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
              Container(
                padding: const EdgeInsets.all(16),
                child: CustomRaisedButton(
                  radius: 8,
                  padding: const EdgeInsets.all(12),
                  textStyle: StyleTheme.textTs
                      .copyWith(color: ColorTheme.primaryColor, fontSize: 16),
                  label: controller.countryLabel,
                  color: ColorTheme.boxColor,
                  onPressed: () {
                    controller.tapCountry(context);
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextField(
                  controller: controller.fieldWhatsappNumber,
                  hintText: 'WhatsappNumber',
                  filledColor: ColorTheme.boxColor,
                  isRequiredType: controller.isEmptyFieldWhatsapp,
                  errorText: 'REQUIRED',
                  labelColor: ColorTheme.primaryColor,
                  filledTextColor: ColorTheme.primaryColor,
                  borderedMode: false,
                  transparencyMode: true,
                  maxLines: 1,
                  keyboardType: TextInputType.phone,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextField(
                  controller: controller.fieldAddress,
                  hintText: 'Address',
                  filledColor: ColorTheme.boxColor,
                  isRequiredType: controller.isEmptyFieldAddress,
                  errorText: 'REQUIRED',
                  labelColor: ColorTheme.primaryColor,
                  filledTextColor: ColorTheme.primaryColor,
                  borderedMode: false,
                  transparencyMode: true,
                  minLines: 6,
                  maxLines: 6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
