import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:trashflow/apis/auth/insert_profile_api.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trashflow/configs/shared_pref_config.dart';
import 'package:trashflow/helpers/alert_helper.dart';
import 'package:trashflow/models/index.dart';
import 'package:trashflow/routes/app_pages.dart';

class AuthController extends BaseController {
  User? googleAuthUser;
  GoogleSignInAccount? googleSignInAccount;
  final FirebaseAuth auth = FirebaseAuth.instance;

  ProfileData? profileData;

  @override
  void onInit() async {
    super.onInit();
    isLoading = true;
    update();
  }

  @override
  void onReady() async {
    isLoading = false;
    update();
    super.onReady();
  }

  @override
  listData({int? pageTo}) async {
    // isLoading = true;
    // update();
  }

  tapContinueGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignInAccount = await googleSignIn.signIn();
    printDebugMode('google name: ${googleSignInAccount?.displayName}');
    printDebugMode('google photo: ${googleSignInAccount?.photoUrl}');
    printDebugMode('google email: ${googleSignInAccount?.email}');
    if (googleSignInAccount != null) {
      upsertProfile(googleSignInAccount);
    }
  }

  upsertProfile(GoogleSignInAccount? googleAuthUser) async {
    isLoading = true;
    update();
    printDebugMode(await InsertProfileApi().payload);
    var result = await InsertProfileApi().request(
      name: googleAuthUser?.displayName ?? '',
      email: googleAuthUser?.email ?? '',
      imageUrl: googleAuthUser?.photoUrl ?? '',
    );
    if (result.success ?? false) {
      profileData = result.data;
      setUserLogin(googleAuthUser);
    } else {
      isLoading = false;
      update();
      AlertHelper.showAlertError(result.message.toString(),
          title: 'Error', alertType: AlertType.dialog);
    }
  }

  setUserLogin(GoogleSignInAccount? googleAuthUser) {
    SharedPrefConfig.setLogin(true);
    ProfileGoogle user = ProfileGoogle();
    user.email = googleAuthUser?.email;
    user.displayName = googleAuthUser?.displayName;
    user.photoUrl = googleAuthUser?.photoUrl;
    SharedPrefConfig.setUserData(user);
    isLoading = false;
    update();
    Get.offAllNamed(AppRoutes.homePage,
        arguments: ScreenArguments()..state = true);
  }
}
