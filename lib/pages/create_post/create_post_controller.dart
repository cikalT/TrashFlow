import 'dart:async';
import 'package:get/get.dart';
import 'package:trashflow/apis/local/get_faq_list_api.dart';
import 'package:trashflow/apis/post/get_category_list_api.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/configs/shared_pref_config.dart';
import 'package:trashflow/models/index.dart';
import 'package:trashflow/routes/app_pages.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostController extends BaseController {
  TextEditingController fieldPostTitle = TextEditingController();
  TextEditingController fieldPostDescription = TextEditingController();
  TextEditingController fieldPostPrice = TextEditingController();

  String categoryText = 'Select Category';
  String categoryId = '';
  List<CategoryData?> postCategoryList = [];

  final ImagePicker picker = ImagePicker();

  @override
  void onInit() async {
    super.onInit();
    isLoading = true;
    update();
  }

  @override
  void onReady() async {
    await getPostCategory();
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

  getPostCategory() async {
    var result = await GetCategoryListApi().request();
    if (result.success ?? false) {
      postCategoryList = result.listData as List<CategoryData?>;
    }
  }

  tapUploadPhoto() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    print(image);
  }
}
