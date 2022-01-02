import 'dart:io';

import 'package:flutter/services.dart';

import 'color_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    dividerColor: Colors.black12,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
        .copyWith(secondary: Colors.white),
  );

  static final lightTheme = ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Poppins',
          primarySwatch: ColorTheme.primaryMaterialColor)
      .copyWith(
    primaryColor: ColorTheme.primaryColor,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: ColorTheme.accentColor),
  );

  static getOverlay(
      {Color? navBarColor,
      bool isLightNavigationBar = false,
      bool isDarkLight = false}) {
    return SystemUiOverlayStyle(
        systemNavigationBarColor: navBarColor ?? ColorTheme.whiteColor,
        systemNavigationBarIconBrightness:
            isLightNavigationBar ? Brightness.light : Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarBrightness: isDarkLight
            ? !Platform.isAndroid
                ? Brightness.light
                : Brightness.dark
            : !Platform.isAndroid
                ? Brightness.dark
                : Brightness.light,
        statusBarIconBrightness:
            isDarkLight ? Brightness.dark : Brightness.light);
  }
}
