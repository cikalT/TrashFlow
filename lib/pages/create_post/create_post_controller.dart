import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:trashflow/apis/post/create_post_api.dart';
import 'package:trashflow/apis/post/get_category_list_api.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/helpers/alert_helper.dart';
import 'package:trashflow/models/index.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trashflow/themes/index.dart';
import 'package:trashflow/widgets/custom_raised_button.dart';
import 'package:image/image.dart' as img;

class CreatePostController extends BaseController {
  TextEditingController fieldPostTitle = TextEditingController();
  TextEditingController fieldPostDescription = TextEditingController();
  TextEditingController fieldPostPrice = TextEditingController();

  String categoryText = 'Select Category';
  String categoryId = '';
  List<CategoryData?> postCategoryList = [];

  bool isSelectImage = false;
  final ImagePicker picker = ImagePicker();
  img.Image? image;
  XFile? xImage;
  Uint8List? byteImage;

  String postType = '';

  @override
  void onInit() async {
    super.onInit();
    isLoading = true;
    update();
  }

  @override
  void onReady() async {
    if (screenArguments != null) {
      postType = screenArguments?.title ?? '';
    }
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
    fieldPostTitle.clear();
    fieldPostDescription.clear();
    fieldPostPrice.clear();
    super.onClose();
  }

  getPostCategory() async {
    var result = await GetCategoryListApi().request();
    if (result.success ?? false) {
      postCategoryList = result.listData as List<CategoryData?>;
    }
  }

  tapUploadPhoto() async {
    var result = await AlertHelper.showBottomSheet(Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomRaisedButton(
            radius: 8,
            padding: const EdgeInsets.all(12),
            textStyle:
                StyleTheme.textTs.copyWith(color: ColorTheme.primaryColor),
            label: 'Camera',
            color: ColorTheme.newBoxColor,
            onPressed: () {
              Get.back(result: 'camera');
            },
          ),
          const SizedBox(
            height: 8,
          ),
          CustomRaisedButton(
            radius: 8,
            padding: const EdgeInsets.all(12),
            textStyle:
                StyleTheme.textTs.copyWith(color: ColorTheme.primaryColor),
            label: 'Gallery',
            color: ColorTheme.newBoxColor,
            onPressed: () {
              Get.back(result: 'gallery');
            },
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    ));
    if (result == 'camera') {
      isLoading = true;
      update();
      xImage = await picker.pickImage(source: ImageSource.camera);
    } else if (result == 'gallery') {
      isLoading = true;
      update();
      xImage = await picker.pickImage(source: ImageSource.gallery);
    } else {
      return;
    }
    if (xImage != null) {
      isSelectImage = true;
      byteImage = await xImage?.readAsBytes();
      image = img.decodeImage(byteImage!);
      isLoading = false;
      update();
    }
  }

  tapCreatePost() async {
    isLoading = true;
    update();
    var result = await CreatePostApi().request(
        title: fieldPostTitle.text,
        description: fieldPostDescription.text,
        price: int.parse(fieldPostPrice.text),
        type: 'SELL',
        categories: categoryId,
        image: File(xImage!.path));
    if (result.success ?? false) {
      Get.back(result: 'ok');
      isLoading = false;
      update();
    }
  }
}
