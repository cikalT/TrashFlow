import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:trashflow/apis/auth/insert_profile_api.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trashflow/configs/shared_pref_config.dart';
import 'package:trashflow/models/index.dart';
import 'package:trashflow/routes/app_pages.dart';

class AuthController extends BaseController {
  User? googleAuthUser;
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

  @override
  void onClose() {
    //code here
    super.onClose();
  }

  tapContinueGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      isLoading = true;
      update();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      UserCredential result = await auth.signInWithCredential(authCredential);
      googleAuthUser = result.user;
      upsertProfile(googleAuthUser);
    }
  }

  upsertProfile(User? googleAuthUser) async {
    var result = await InsertProfileApi().request(
        name: googleAuthUser?.displayName ?? '',
        email: googleAuthUser?.email ?? '',
        imageUrl: googleAuthUser?.photoURL ?? '');
    if (result.success ?? false) {
      profileData = result.data;
      isLoading = false;
      update();
      setUserLogin(googleAuthUser);
    } else {
      printDebugMode('fail');
    }
  }

  setUserLogin(User? googleAuthUser) {
    SharedPrefConfig.setLogin(true);
    ProfileGoogle user = ProfileGoogle();
    user.email = googleAuthUser?.email;
    user.displayName = googleAuthUser?.displayName;
    user.photoUrl = googleAuthUser?.photoURL;
    SharedPrefConfig.setUserData(user);
    Get.offAllNamed(AppRoutes.homePage,
        arguments: ScreenArguments()..state = true);
  }
}
