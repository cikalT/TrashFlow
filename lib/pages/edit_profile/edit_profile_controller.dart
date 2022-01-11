import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:trashflow/apis/auth/update_profile_api.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/models/index.dart';

class EditProfileController extends BaseController {
  ProfileGoogle? profileGoogle;
  ProfileData? profileData;

  Location location = Location();
  bool serviceEnabled = false;
  PermissionStatus? permissionGranted;
  LocationData? locationData;

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

  tapSave() async {
    isLoading = true;
    update();
    String email = profileGoogle?.email ?? '';
    String address = fieldAddress.text;
    String phone = fieldWhatsappNumber.text;
    double latitude = locationData?.latitude ?? 0;
    double longitude = locationData?.longitude ?? 0;
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
