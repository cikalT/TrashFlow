import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:trashflow/pages/splash_screen/splash_screen_page.dart';
import 'pages/misc/unknown_page.dart';
import 'routes/index.dart';
import 'themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runZonedGuarded<Future<void>>(() async {
    startup(AppTheme.lightTheme);
  }, (error, stackTrace) {
    if (kDebugMode) {
      print('runZonedGuarded: Caught error in my root zone.');
    }
  });
}

void startup(ThemeData themeData) {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return OverlaySupport.global(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.fadeIn,
            theme: themeData,
            home: const SplashScreenPage(),
            getPages: AppPages.pages,
            unknownRoute: GetPage(
              name: '/unknown',
              page: () => const UnknownPage(),
            ),
          ),
        );
      },
    ),
  );
}
