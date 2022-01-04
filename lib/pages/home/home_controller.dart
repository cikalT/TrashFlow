import 'package:get/get.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:trashflow/themes/index.dart';

class HomeController extends BaseController {
  bool isFromLogin = false;
  int currentIndex = 0;

  @override
  void onInit() async {
    super.onInit();
    isLoading = true;
    update();
  }

  @override
  void onReady() async {
    if (screenArguments?.state != null) {
      isFromLogin = screenArguments?.state ?? false;
    }
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
