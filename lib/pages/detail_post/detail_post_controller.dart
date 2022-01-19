import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trashflow/apis/post/delete_post_api.dart';
import 'package:trashflow/apis/post/get_category_list_api.dart';
import 'package:trashflow/apis/post/update_post_api.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/helpers/alert_helper.dart';
import 'package:trashflow/models/index.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geocoding/geocoding.dart' as Geocoding;

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
  String titlePage = '';
  String buttonPage = '...';

  Completer<GoogleMapController> mapController = Completer();
  List<Geocoding.Placemark>? placemarks;
  String district = '';

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
        await getPostCategory();
        buttonPage = 'Update Post';
        titlePage = 'Update Post';
      } else {
        buttonPage = 'Chat Now';
        titlePage = '';
        isLoading = false;
        update();
      }
    }
    setPostData();
    placemarks = await Geocoding.placemarkFromCoordinates(
        postData?.author?.latitude ?? 0, postData?.author?.longitude ?? 0,
        localeIdentifier: "id_ID");
    district =
        '${placemarks!.first.subAdministrativeArea}, ${placemarks!.first.administrativeArea}';
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
      isLoading = false;
      update();
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
      isButtonLoading = false;
      isLoading = false;
      update();
      Get.back(result: 'update');
    } else {
      isButtonLoading = false;
      isLoading = false;
      update();
      AlertHelper.showAlertError(result.message.toString(),
          title: 'Error', alertType: AlertType.dialog);
    }
  }

  tapDeletePost() async {
    isButtonLoading = true;
    isLoading = true;
    update();
    var result = await DeletePostApi().request(postId: postData?.id ?? '');
    if (result.success ?? false) {
      isButtonLoading = false;
      isLoading = false;
      update();
      Get.back(result: 'delete');
    } else {
      isButtonLoading = false;
      isLoading = false;
      update();
      AlertHelper.showAlertError(result.message.toString(),
          title: 'Error', alertType: AlertType.dialog);
    }
  }

  tapMessageOwner() async {
    String number = postData?.author?.phone ?? '';
    String status = '';
    String message = '';
    if (postData?.type == 'SELL') {
      status = 'buy';
      message =
          'Hello, I am interesting to $status your *${postData?.title}* that you post on TrashFlow. Can I know where we can meet up? Thank you!';
    } else {
      status = 'sell';
      message =
          'Hello, I am interesting to $status you some *${postData?.categories?.first?.name}* that you post on TrashFlow. Can I know where we can meet up? Thank you!';
    }
    await launch('https://wa.me/$number?text=$message');
  }

  Marker setMapMarker() {
    return Marker(
      markerId: const MarkerId('Location Marker'),
      position: LatLng(
          postData?.author?.latitude ?? 0, postData?.author?.longitude ?? 0),
      icon: BitmapDescriptor.defaultMarker,
    );
  }
}
