import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:btw/apis/auth/me_api.dart';
import 'package:btw/configs/index.dart';
import 'package:btw/helpers/index.dart';
import 'package:btw/models/index.dart';

import 'package:btw/pages/global/webview/webview_page.dart';
import 'package:btw/services/index.dart';
import 'package:btw/themes/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
export 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
export 'package:btw/routes/index.dart';

class BaseController extends GetxController {
  bool showAppBar = false;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(val) {
    _isLoading = val;
    update();
  }

  ScreenArguments? screenArguments;
  EasyRefreshController refreshController = EasyRefreshController();
  Duration animateDuration = new Duration(milliseconds: 500);
  Widget progressIndicator = Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
      ],
    ),
  );
  double progressOpacity = 0.5;
  Color progressColor = Colors.black45;
  int perPage = 12;
  bool isDarkThemeMode = false;

  final _remoteConfigService =
      (!FeatureConfig.isDesktop) ? Get.find<RemoteConfigService>() : null;
  int? get currentBuildNumber => _remoteConfigService?.currentBuildNumber;
  int? get requiredBuildNumber => _remoteConfigService?.requiredBuildNumber;

  // Feature
  int? get featureFeedVersion => _remoteConfigService?.featureFeedVersion;

  //connection
  bool isLostConnection = false;
  bool isShowConnectionLostPopUp = true;
  final Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? connectivitySubscription;

  @override
  void onInit() async {
    if (Get.arguments != null)
      screenArguments = Get.arguments as ScreenArguments;
    showAppBar = screenArguments?.showAppBar ?? false;
    if (FeatureConfig.featureDarkModeChangeableAny)
      isDarkThemeMode = await DataService.getBool(DataService.keyDarkMode);
    if (FeatureConfig.featureCheckConnection) {
      initConnectivity();
      connectivitySubscription =
          connectivity.onConnectivityChanged.listen(updateConnectionStatus);
    }
    super.onInit();
  }

  @override
  void onClose() {
    if (FeatureConfig.featureCheckConnection) {
      connectivitySubscription?.cancel();
    }
    super.onClose();
  }

  setTheme({required bool isLightTheme}) async {
    if (isLightTheme) {
      print('setting light theme');
      if (FeatureConfig.featureDarkModeChangeableAny) isDarkThemeMode = true;
      await DataService.setBool(DataService.keyDarkMode, false);
      Get.changeTheme(AppTheme.lightTheme);
    } else {
      print('setting dark theme');
      if (FeatureConfig.featureDarkModeChangeableAny) isDarkThemeMode = false;
      await DataService.setBool(DataService.keyDarkMode, true);
      Get.changeTheme(AppTheme.darkTheme);
    }
  }

  listData({int? pageTo}) async {}

  Future<bool> onRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      this.listData(pageTo: 1);
    });
    return true;
  }

  Future<bool> onLoadMore() async {
    await Future.delayed(Duration(seconds: 1), () {
      this.listData();
    });
    return true;
  }

  Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version +
        ((!FeatureConfig.isDesktop)
            ? '.' + packageInfo.buildNumber
            : '_desktopClient');
  }

  void versionCheck() {
    if (AppConfig.getBuildNumber < (requiredBuildNumber ?? 0)) {
      AlertHelper.showVersionDialog(forceUpdate: true);
    } else {
      if (AppConfig.getBuildNumber < (currentBuildNumber ?? 0)) {
        AlertHelper.showVersionDialog(forceUpdate: false);
      }
    }
  }

  bool isForceUpdateAvailable() {
    if (AppConfig.getBuildNumber < (requiredBuildNumber ?? 0)) {
      return true;
    } else {
      if (AppConfig.getBuildNumber < (currentBuildNumber ?? 0)) {
        return false;
      }
    }
    return false;
  }

  openLink(String? url,
      {bool openBrowser: true,
      String title: '',
      bool replacePage: false,
      bool hideControl: false,
      bool isPayment: false}) async {
    if (url != null) {
      if (url.length > 10 && url.substring(0, 11) == "smartbtw://") {
        Get.toNamed(url.substring(11));
        return;
      } else if (openBrowser || FeatureConfig.isDesktop) {
        try {
          // if (await canLaunch(url)) {
          await launch(url);
          // } else {
          //   Fluttertoast.showToast(
          //       msg:
          //           "Terjadi kesalahan, silahkan cek ulang izin Buka secara default aplikasi lalu coba lagi",
          //       toastLength: Toast.LENGTH_LONG,
          //       gravity: ToastGravity.BOTTOM,
          //       timeInSecForIosWeb: 1,
          //       backgroundColor: ColorTheme.primaryColor,
          //       textColor: Colors.white,
          //       fontSize: 16.0);
          // }
        } catch (e) {
          Fluttertoast.showToast(
              msg:
                  "Terjadi kesalahan, silahkan cek ulang izin Buka secara default aplikasi lalu coba lagi",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: ColorTheme.primaryColor,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      } else {
        if (replacePage) {
          await Get.off(WebViewPage(
            url: url,
            title: title,
            hideControl: hideControl,
            isPayment: isPayment,
          ));
        } else {
          await Get.to(WebViewPage(
            url: url,
            title: title,
            hideControl: hideControl,
            isPayment: isPayment,
          ));
        }
      }
    }
  }

  getUserData() async {
    User? user = await AuthService.getUserData();
    if (user == null) {
      var result = await MeApi().request();
      if (result.status ?? false) {
        user = result.data;
        if (user != null) {
          await AuthService.setUserData(user);
        }
      }
    }
    return user;
  }

  enterRouteSlideUp({required Widget page, dynamic arguments}) {
    Navigator.of(Get.context!).push(moveSlideUp(page));
  }

  Route moveSlideUp(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return updateConnectionStatus(result);
  }

  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        isLostConnection = false;
        if (Platform.isIOS) {
          if (!ConstantsService.isInitStoreIAP) {
            if ((Get.find<InAppPurchaseController>().products?.length ?? 0) <
                1) {
              Get.find<InAppPurchaseController>().initStoreInfo();
            }
          }
        }
        // update();
        break;
      case ConnectivityResult.none:
        isLostConnection = true;
        // update();
        break;
    }
    update();
  }
}
