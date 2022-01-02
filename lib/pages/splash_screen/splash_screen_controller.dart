import 'package:trashflow/base/base_controller.dart';

class SplashScreenController extends BaseController {
  @override
  void onInit() async {
    super.onInit();
    isLoading = true;
    update();
  }

  @override
  void onReady() async {
    //code here
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
