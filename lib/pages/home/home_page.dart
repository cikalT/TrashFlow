import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/base/base_widget.dart';
import 'package:trashflow/routes/index.dart';
import 'package:trashflow/themes/index.dart';

import 'home_controller.dart';
import 'sections/home_section.dart';
import 'sections/sell_section.dart';
import 'sections/add_post_section.dart';
import 'sections/buy_section.dart';
import 'sections/profile_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => BaseWidget(
        controller: controller,
        isLoading: controller.isLoading,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorTheme.primaryColor,
          toolbarHeight: 0,
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: controller.currentIndex,
          onTap: (i) {
            controller.currentIndex = i;
            controller.update();
          },
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              selectedColor: ColorTheme.primaryColor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.attach_money),
              title: const Text('Sell'),
              selectedColor: ColorTheme.primaryColor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.add_circle),
              title: const Text('Create'),
              selectedColor: ColorTheme.primaryColor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.shopping_basket),
              title: const Text('Buy'),
              selectedColor: ColorTheme.primaryColor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text('Profile'),
              selectedColor: ColorTheme.primaryColor,
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            if (controller.currentIndex == 0)
              const HomeSection()
            else if (controller.currentIndex == 1)
              const SellSection()
            else if (controller.currentIndex == 2)
              const AddPostSection()
            else if (controller.currentIndex == 3)
              const BuySection()
            else if (controller.currentIndex == 4)
              const ProfileSection(),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
