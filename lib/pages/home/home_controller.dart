import 'package:flutter/foundation.dart';
import 'package:trashflow/apis/auth/insert_profile_api.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/helpers/index.dart';
import 'package:trashflow/models/index.dart';

class HomeController extends BaseController {

  int currentIndex = 0;

  @override
  void onInit() async {
    super.onInit();
    isLoading = true;
    update();
  }

  @override
  void onReady() async {
    // await testApi();
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
}
