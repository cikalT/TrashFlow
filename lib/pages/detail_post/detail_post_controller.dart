import 'package:trashflow/apis/local/get_faq_list_api.dart';
import 'package:trashflow/apis/post/get_category_list_api.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/models/index.dart';

class DetailPostController extends BaseController {
  TextEditingController fieldPostTitle = TextEditingController();
  TextEditingController fieldPostDescription = TextEditingController();
  TextEditingController fieldPostPrice = TextEditingController();

  String categoryText = 'Select Category';
  String categoryId = '';
  List<CategoryData?> postCategoryList = [];
  String postType = '';

  PostData? postData;
  bool isAuthor = false;

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

  tapUpdatePost() {}

  tapDeletePost() {}
}
