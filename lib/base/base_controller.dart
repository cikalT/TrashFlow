import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:trashflow/apis/auth/get_profile_api.dart';
import 'package:trashflow/configs/shared_pref_config.dart';
import 'package:trashflow/models/index.dart';
export 'package:flutter/material.dart';

class BaseController extends GetxController {
  bool showAppBar = false;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(val) {
    _isLoading = val;
    update();
  }

  ScreenArguments? screenArguments;
  EasyRefreshController refreshController = EasyRefreshController();
  Duration animateDuration = const Duration(milliseconds: 500);
  Widget progressIndicator = Container(
    height: 100,
    width: 100,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircularProgressIndicator(),
      ],
    ),
  );
  double progressOpacity = 0.5;
  Color progressColor = Colors.black45;
  int perPage = 12;
  bool isDarkThemeMode = false;

  @override
  void onInit() async {
    if (Get.arguments != null) {
      screenArguments = Get.arguments as ScreenArguments;
    }
    super.onInit();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  listData({int? pageTo}) async {}

  Future<bool> onRefresh() async {
    await Future.delayed(const Duration(seconds: 1), () {
      listData(pageTo: 1);
    });
    return true;
  }

  Future<bool> onLoadMore() async {
    await Future.delayed(const Duration(seconds: 1), () {
      listData();
    });
    return true;
  }

  printDebugMode(dynamic printValue) {
    if (kDebugMode) {
      print(printValue);
    }
  }

  getProfileGoogle() async {
    ProfileGoogle? profileGoogle = await SharedPrefConfig.getUserData();
    return profileGoogle;
  }

  getUserProfile(ProfileGoogle? profileGoogle) async {
    ProfileData? profileData;
    var result = await GetProfileApi().request(profileGoogle?.email ?? '');
    if (result.success ?? false) {
      profileData = result.data as ProfileData?;
    }
    return profileData;
  }
}
