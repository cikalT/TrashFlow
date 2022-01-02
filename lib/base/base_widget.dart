import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:loading_overlay/loading_overlay.dart';

class BaseWidget extends StatelessWidget {
  final dynamic controller;
  final String? title;
  final Color customColor;
  final bool useAppbar;
  final Widget? child;
  final bool safeAreaTop;
  final bool safeAreaLeft;
  final bool safeAreaRight;
  final bool safeAreaBottom;
  final bool hasRefresh;
  final bool hasLoadMore;
  final bool requestFocus;
  final Widget? bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final bool isLoading;
  final bool isAppBarLogo;
  final Widget? floatingActionButton;
  final bool showDeveloperMode;
  final bool extendBody;
  final String? customDeveloperText;
  final Color? navigationBarColor;
  const BaseWidget(
      {Key? key,
      required this.controller,
      this.title,
      this.useAppbar = true,
      this.child,
      this.safeAreaTop = false,
      this.safeAreaLeft = true,
      this.safeAreaRight = true,
      this.safeAreaBottom = false,
      this.hasRefresh = false,
      this.hasLoadMore = false,
      this.requestFocus = true,
      this.showDeveloperMode = true,
      this.extendBody = false,
      this.bottomNavigationBar,
      this.body,
      this.appBar,
      this.customColor = Colors.white,
      this.isLoading = false,
      this.floatingActionButtonLocation,
      this.isAppBarLogo = false,
      this.floatingActionButton,
      this.navigationBarColor,
      this.customDeveloperText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return MediaQuery(
      data: mediaQueryData.copyWith(textScaleFactor: 1.0),
      child: LoadingOverlay(
        isLoading: isLoading,
        opacity: controller.progressOpacity,
        color: controller.progressColor,
        progressIndicator: controller.progressIndicator,
        child: SafeArea(
          top: safeAreaTop,
          left: safeAreaLeft,
          right: safeAreaRight,
          bottom: safeAreaBottom,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: appBar,
            body: _body(),
            backgroundColor: customColor,
            bottomNavigationBar: bottomNavigationBar,
            extendBody: extendBody,
            floatingActionButtonLocation: floatingActionButtonLocation,
            floatingActionButton: floatingActionButton,
          ),
        ),
      ),
    );
  }

  Widget? _body() {
    if ((hasRefresh || hasLoadMore) && controller?.refreshController != null) {
      return EasyRefresh(
        header: MaterialHeader(),
        controller: controller.refreshController,
        onRefresh: hasRefresh ? controller.onRefresh : null,
        onLoad: hasLoadMore ? controller.onLoadMore : null,
        child: child,
      );
    } else {
      return child;
    }
  }
}
