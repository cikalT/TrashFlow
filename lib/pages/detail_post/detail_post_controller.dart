import 'package:get/get.dart';
import 'package:trashflow/apis/post/delete_post_api.dart';
import 'package:trashflow/apis/post/get_category_list_api.dart';
import 'package:trashflow/apis/post/update_post_api.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/helpers/alert_helper.dart';
import 'package:trashflow/models/index.dart';

class DetailPostController extends BaseController {
  bool isButtonLoading = false;
  TextEditingController fieldPostTitle = TextEditingController();
  TextEditingController fieldPostDescription = TextEditingController();
  TextEditingController fieldPostPrice = TextEditingController();

  String categoryText = 'Select Category';
  String categoryId = '';
  List<CategoryData?> postCategoryList = [];
  String postType = '';

  PostData? postData;
  bool isAuthor = false;
  String titlePage = '...';
  String buttonPage = '...';

  @override
  void onInit() async {
    super.onInit();
    isLoading = true;
    update();
  }

  @override
  void onReady() async {
    if (screenArguments != null) {
      postData = screenArguments?.data as PostData?;
      isAuthor = screenArguments?.state ?? false;
      if (isAuthor) {
        buttonPage = 'Update Post';
        titlePage = 'Update Post';
      } else {
        buttonPage = 'Message Owner';
        titlePage = postData?.title ?? '';
      }
    }
    await getPostCategory();
    setPostData();
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
    } else {
      Get.back(result: 'error');
    }
  }

  setPostData() {
    postType = postData!.type!.toLowerCase();
    categoryText = postData!.categories!.first!.name!;
    categoryId = postData!.categories!.first!.id!;
    fieldPostTitle.text = postData?.title ?? '';
    fieldPostDescription.text = postData?.description ?? '';
    fieldPostPrice.text = postData?.price.toString() ?? '';
  }

  tapButtonPost() {
    if (isAuthor) {
      tapUpdatePost();
    } else {
      tapMessageOwner();
    }
  }

  tapUpdatePost() async {
    FocusManager.instance.primaryFocus?.unfocus();
    isButtonLoading = true;
    isLoading = true;
    update();
    var result = await UpdatePostApi().request(
        postId: postData?.id ?? '',
        title: fieldPostTitle.text,
        description: fieldPostDescription.text,
        price: int.parse(fieldPostPrice.text),
        type: postType.toUpperCase(),
        categories: categoryId);
    if (result.success ?? false) {
      Get.back(result: 'update');
    } else {
      AlertHelper.showAlertTrigger('Failed to Update Item');
    }
    isButtonLoading = false;
    isLoading = false;
    update();
  }

  tapDeletePost() async {
    isButtonLoading = true;
    isLoading = true;
    update();
    var result = await DeletePostApi().request(postId: postData?.id ?? '');
    if (result.success ?? false) {
      Get.back(result: 'delete');
    } else {
      AlertHelper.showAlertTrigger('Failed to Delete Item');
    }
    isButtonLoading = false;
    isLoading = false;
    update();
  }

  tapMessageOwner() {}
}
