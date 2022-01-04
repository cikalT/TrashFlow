import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:trashflow/apis/auth/insert_profile_api.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/helpers/index.dart';
import 'package:trashflow/models/index.dart';
import 'package:trashflow/routes/app_pages.dart';

class SplashScreenController extends BaseController {
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
    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.homePage);
    });
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

  testApi() async {
    var result =
        await InsertProfileApi().request(email: 'cikaltaruna@gmail.com');
    if (result.success ?? false) {
      profileData = result.data;
    } else {
      printDebugMode('fail');
    }
  }
}
