import 'package:trashflow/apis/local/get_faq_list_api.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/models/index.dart';

class FaqController extends BaseController {
  List<FaqData?> faqDataList = [];

  @override
  void onInit() async {
    super.onInit();
    isLoading = true;
    update();
  }

  @override
  void onReady() async {
    await getFaqList();
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

  getFaqList() async {
    var result = await GetFaqListLocalApi().request();
    if (result.success ?? false) {
      faqDataList = result.listData as List<FaqData?>;
    }
  }
}
