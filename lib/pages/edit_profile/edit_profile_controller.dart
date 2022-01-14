import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:trashflow/apis/auth/update_profile_api.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/helpers/alert_helper.dart';
import 'package:trashflow/models/index.dart';

class EditProfileController extends BaseController {
  ProfileGoogle? profileGoogle;
  ProfileData? profileData;

  Location location = Location();
  bool serviceEnabled = false;
  PermissionStatus? permissionGranted;
  LocationData? locationData;

  String countryLabel = 'Country';
  Country? selectedCountry;
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
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        permissionGranted = await location.requestPermission();
      }
    }
    locationData = await location.getLocation();
    super.onReady();
  }

  @override
  listData({int? pageTo}) async {
    // isLoading = true;
    // update();
  }

  @override
  void onClose() {
    fieldWhatsappNumber.clear();
    fieldAddress.clear();
    super.onClose();
  }

  tapCountry(BuildContext context) {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        selectedCountry = country;
        countryLabel = selectedCountry?.name ?? '';
        update();
      },
    );
  }

  tapUpdate() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isLoading = true;
    update();
    if (selectedCountry != null) {
      if (fieldAddress.text.isNotEmpty && fieldWhatsappNumber.text.isNotEmpty) {
        String currentPhone = fieldWhatsappNumber.text;
        String name = profileGoogle?.displayName ?? '';
        String email = profileGoogle?.email ?? '';
        String address = fieldAddress.text;
        String phone =
            replaceCharAt(currentPhone, 0, selectedCountry?.phoneCode ?? '');
        double latitude = locationData?.latitude ?? 0;
        double longitude = locationData?.longitude ?? 0;
        var result = await UpdateProfileApi().request(
            name: name,
            email: email,
            address: address,
            phone: phone,
            latitude: latitude,
            longitude: longitude);
        if (result.success ?? false) {
          isLoading = false;
          update();
          Get.back(result: 'ok');
        } else {
          isLoading = false;
          update();
          AlertHelper.showAlertTrigger('Failed to update profile');
        }
      } else {
        isLoading = false;
        update();
        AlertHelper.showAlertTrigger('Some field need to be filled!');
      }
    } else {
      isLoading = false;
      update();
      AlertHelper.showAlertTrigger('Select your country first!');
    }
  }

  String replaceCharAt(String oldString, int index, String newChar) {
    if (oldString[0] == '0') {
      return oldString.substring(0, index) +
          newChar +
          oldString.substring(index + 1);
    } else {
      return oldString;
    }
  }
}
