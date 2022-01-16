import 'dart:async';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:location/location.dart';
import 'package:trashflow/apis/post/get_people_buy_post_list_api.dart';
import 'package:trashflow/apis/post/get_people_sell_post_list_api.dart';
import 'package:trashflow/apis/post/get_user_post_list_api.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:trashflow/configs/shared_pref_config.dart';
import 'package:trashflow/helpers/alert_helper.dart';
import 'package:trashflow/models/index.dart';
import 'package:trashflow/routes/app_pages.dart';
import 'package:trashflow/themes/index.dart';
import 'package:trashflow/widgets/confirmation_bottomsheet.dart';
import 'package:trashflow/widgets/custom_raised_button.dart';
import 'package:url_launcher/url_launcher.dart';

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

  //main
  List<PostData?> postDataList = [];

  //home
  List<PostData?> myPostDataList = [];

  //sell
  List<PostData?> peopleBuyPostDataList = [];

  //buy
  List<PostData?> peopleSellPostDataList = [];

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
              title: 'Welcome!',
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
    printInfo(info: 'Closing Services');
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
      await getMyPostList();
      isLoading = false;
      update();
    } else if (index == 1) {
      await getPeopleBuyPostList();
      isLoading = false;
      update();
    } else if (index == 2) {
      isLoading = false;
      update();
    } else if (index == 3) {
      await getPeopleSellPostList();
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

  tapPost(PostData? postData, int index, bool isAuthor) async {
    var result = await Get.toNamed(AppRoutes.detailPostPage,
        arguments: ScreenArguments()
          ..data = postData
          ..state = isAuthor);
    if (result == 'update') {
      loadMenuData(index);
      MotionToast.success(
              title: 'Item Updated',
              titleStyle: StyleTheme.headerTs.copyWith(),
              description: 'Success update post',
              descriptionStyle: StyleTheme.textTs.copyWith(),
              width: 300)
          .show(Get.context!);
    }
    if (result == 'delete') {
      loadMenuData(index);
      MotionToast.success(
              title: 'Item Deleted',
              titleStyle: StyleTheme.headerTs.copyWith(),
              description: 'Success delete post',
              descriptionStyle: StyleTheme.textTs.copyWith(),
              width: 300)
          .show(Get.context!);
    }
    if (result == 'error') {
      AlertHelper.showAlertTrigger('Something went wrong, try again');
    }
  }
  //end main call function

  //start home section function
  getMyPostList() async {
    postDataList.clear();
    var result = await GetUserPostListApi().request();
    if (result.success ?? false) {
      postDataList = result.listData as List<PostData?>;
      myPostDataList = postDataList
          .where((element) => element?.author?.email == profileGoogle?.email)
          .toList();
      myPostDataList.sort((b, a) => a!.createdAt!.compareTo(b!.createdAt!));
    }else {
      AlertHelper.showAlertError(result.message.toString(),
          title: 'Error', alertType: AlertType.dialog);
    }
  }
  //end home section function

  //start sell section function
  getPeopleBuyPostList() async {
    postDataList.clear();
    var result = await GetPeopleBuyPostListApi().request();
    if (result.success ?? false) {
      postDataList = result.listData as List<PostData?>;
      peopleBuyPostDataList = postDataList
          .where((element) =>
              element?.type == 'BUY' &&
              element?.author?.email != profileGoogle?.email)
          .toList();
      peopleBuyPostDataList
          .sort((b, a) => a!.createdAt!.compareTo(b!.createdAt!));
    } else {
      AlertHelper.showAlertError(result.message.toString(),
          title: 'Error', alertType: AlertType.dialog);
    }
  }
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
  getPeopleSellPostList() async {
    postDataList.clear();
    var result = await GetPeopleSellPostListApi().request();
    if (result.success ?? false) {
      postDataList = result.listData as List<PostData?>;
      peopleSellPostDataList = postDataList
          .where((element) =>
              element?.type == 'SELL' &&
              element?.author?.email != profileGoogle?.email)
          .toList();
      peopleSellPostDataList
          .sort((b, a) => a!.createdAt!.compareTo(b!.createdAt!));
    } else {
      AlertHelper.showAlertError(result.message.toString(),
          title: 'Error', alertType: AlertType.dialog);
    }
  }
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

  tapAbout(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ConfirmationBottomSheet(
          title: 'About This App',
          desc:
              'This application is developed by using Flutter Framework and ExpressJS for backend.\n\nThis application purpose is to allow people to easily recycle their trash and let them earn money from them. Our main goal is to promote recycling and also for a sustainable environment.\n\n\nMade with ♥ by students of STMIK Primakara',
          confirmation: true,
          customIya: 'OK',
          onTapYes: () {
            Get.back();
          },
          customNo: 'LEARN MORE',
          onTapNo: () {
            Get.back();
            tapLearnMore();
          },
          customDecoration: BoxDecoration(
            color: ColorTheme.boxColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.13),
                spreadRadius: 1.4,
                blurRadius: 4.5,
                blurStyle: BlurStyle.outer,
                offset: Offset.fromDirection(2.0),
              ),
            ],
          ),
        );
      },
    );
  }

  tapLearnMore() {
    AlertHelper.showBottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomRaisedButton(
              radius: 8,
              padding: const EdgeInsets.all(12),
              textStyle:
                  StyleTheme.textTs.copyWith(color: ColorTheme.primaryColor),
              label: 'Flutter Project',
              color: ColorTheme.boxColor,
              onPressed: () async {
                Get.back();
                await launch('https://github.com/cikalT/TrashFlow');
              },
            ),
            const SizedBox(
              height: 8,
            ),
            CustomRaisedButton(
              radius: 8,
              padding: const EdgeInsets.all(12),
              textStyle:
                  StyleTheme.textTs.copyWith(color: ColorTheme.primaryColor),
              label: 'Backend Api',
              color: ColorTheme.boxColor,
              onPressed: () async {
                Get.back();
                await launch('https://github.com/labasubagia22/trashflow_api');
              },
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
      canHide: true,
    );
  }
  //end profile section function
}
