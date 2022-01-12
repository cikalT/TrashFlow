import 'dart:async';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:location/location.dart';
import 'package:trashflow/apis/post/get_user_post_list_api.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:trashflow/configs/shared_pref_config.dart';
import 'package:trashflow/models/index.dart';
import 'package:trashflow/routes/app_pages.dart';
import 'package:trashflow/themes/index.dart';

class HomeController extends BaseController {
  bool isFromLogin = false;
  int currentIndex = 0;

  GoogleSignIn googleSignIn = GoogleSignIn();

  ProfileGoogle? profileGoogle;
  ProfileData? profileData;

  //location request component
  Location location = Location();
  bool serviceEnabled = false;
  PermissionStatus? permissionGranted;
  LocationData? locationData;

  //home
  List<PostData?> postDataList = [];

  @override
  void onInit() async {
    super.onInit();
    isLoading = true;
    update();
  }

  @override
  void onReady() async {
    await getAccount();
    if (screenArguments?.state != null) {
      isFromLogin = screenArguments?.state ?? false;
    }
    loadMenuData(currentIndex);
    isLoading = false;
    update();
    if (isFromLogin) {
      MotionToast.success(
              title: 'Welcome Back!',
              titleStyle: StyleTheme.headerTs.copyWith(),
              description: 'Lets start conserve the environment',
              descriptionStyle: StyleTheme.textTs.copyWith(),
              width: 300)
          .show(Get.context!);
    }
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
    isLoading = true;
    update();
    await getAccount();
    isLoading = false;
    update();
  }

  @override
  void onClose() {
    //code here
    super.onClose();
  }

  tapMenu(int index) {
    currentIndex = index;
    isLoading = true;
    loadMenuData(index);
    update();
  }

  loadMenuData(int index) async {
    isLoading = true;
    update();
    if (index == 0) {
      await getPostList();
      isLoading = false;
      update();
    } else if (index == 1) {
      isLoading = false;
      update();
    } else if (index == 2) {
      isLoading = false;
      update();
    } else if (index == 3) {
      isLoading = false;
      update();
    } else if (index == 4) {
      isLoading = false;
      update();
    }
  }

  //start main call function
  getAccount() async {
    profileGoogle = await getProfileGoogle();
    profileData = await getUserProfile(profileGoogle);
  }

  tapPost(PostData? postData, int index, bool status) {
    Get.toNamed(AppRoutes.detailPostPage,
        arguments: ScreenArguments()
          ..data = postData
          ..state = status);
  }
  //end main call function

  //start home section function
  getPostList() async {
    var result = await GetUserPostListApi().request();
    if (result.success ?? false) {
      postDataList = result.listData as List<PostData?>;
    }
  }
  //end home section function

  //start sell section function
  //end sell section function

  //start add post section function
  tapCreatePost(String type) async {
    var result = await Get.toNamed(AppRoutes.createPostPage,
        arguments: ScreenArguments()..title = type);
    if (result == 'ok') {
      MotionToast.success(
              title: 'Item Posted',
              titleStyle: StyleTheme.headerTs.copyWith(),
              description: 'Success create post',
              descriptionStyle: StyleTheme.textTs.copyWith(),
              width: 300)
          .show(Get.context!);
    }
  }
  //end add post section function

  //start buy section function
  //end buy section function

  //start profile section function
  tapEditProfile() async {
    var result = await Get.toNamed(AppRoutes.editProfilePage);
    printDebugMode(result);
    if (result == 'ok') {
      isLoading = true;
      update();
      await getAccount();
      isLoading = false;
      update();
      MotionToast.success(
              title: 'Profile Updated!',
              titleStyle: StyleTheme.headerTs.copyWith(),
              description: 'Success update profile',
              descriptionStyle: StyleTheme.textTs.copyWith(),
              width: 300)
          .show(Get.context!);
    }
  }

  tapFaq() {
    Get.toNamed(AppRoutes.faqPage);
  }

  tapProfileLogOut() async {
    bool isDestroy = await SharedPrefConfig.removeSession();
    if (isDestroy) {
      googleSignIn.disconnect();
      MotionToast.warning(
              title: 'Log Out',
              titleStyle: StyleTheme.headerTs.copyWith(),
              description: 'You will be redirected to Auth',
              descriptionStyle: StyleTheme.textTs.copyWith(),
              width: 320)
          .show(Get.context!);
      Timer(const Duration(seconds: 3), () {
        Get.offAllNamed(AppRoutes.splashScreenPage);
      });
    }
  }
  //end profile section function
}
