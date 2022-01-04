import 'package:get/get.dart';
import 'package:trashflow/pages/home/home_page.dart';
import 'package:trashflow/pages/splash_screen/splash_screen_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.splashScreenPage,
        page: () => const SplashScreenPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.homePage,
        page: () => const HomePage(),
        transition: Transition.fadeIn),
  ];
}
