import 'dart:async';
import 'package:get/get.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/configs/shared_pref_config.dart';
import 'package:trashflow/models/index.dart';
import 'package:trashflow/routes/app_pages.dart';

class FaqController extends BaseController {
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
}
