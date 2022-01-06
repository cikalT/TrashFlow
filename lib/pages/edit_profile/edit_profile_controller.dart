import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:trashflow/apis/auth/update_profile_api.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/configs/shared_pref_config.dart';
import 'package:trashflow/models/index.dart';
import 'package:trashflow/routes/app_pages.dart';

class EditProfileController extends BaseController {
  ProfileGoogle? profileGoogle;
  ProfileData? profileData;

  TextEditingController fieldWhatsappNumber = TextEditingController();
  bool isEmptyFieldWhatsapp = true;
  TextEditingController fieldAddress = TextEditingController();
  bool isEmptyFieldAddress = true;

  @override
  void onInit() async {
    super.onInit();
    isLoading = true;
    update();
  }

  @override
  void onReady() async {
    profileGoogle = await getProfileGoogle();
    profileData = await getUserProfile(profileGoogle);
    fieldWhatsappNumber.text = profileData?.phone ?? '';
    fieldAddress.text = profileData?.address ?? '';
    isLoading = false;
    update();
    super.onReady();
  }

  @override
  listData({int? pageTo}) async {
    // isLoading = true;
    // update();
  }

  @override
  void onClose() {
    //code here
    super.onClose();
  }

  tapUploadPicture() {}

  tapSave() async {
    isLoading = true;
    update();
    String email = profileGoogle?.email ?? '';
    String address = fieldAddress.text;
    String phone = fieldWhatsappNumber.text;
    double latitude = 0;
    double longitude = 0;
    if (address.isNotEmpty && phone.isNotEmpty) {
      var result = await UpdateProfileApi().request(
          email: email,
          address: address,
          phone: phone,
          latitude: latitude,
          longitude: longitude);
      if (result.success ?? false) {
        isLoading = false;
        update();
        Get.back(result: 'ok');
      }
    }
  }
}
