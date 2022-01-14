import 'package:get/get.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/themes/index.dart';
import 'package:trashflow/widgets/post_item.dart';

import '../home_controller.dart';

class SellSection extends StatelessWidget {
  const SellSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        color: ColorTheme.newBoxColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: ColorTheme.whiteColor,
              title: Text(
                'People who want to buy some trash',
                style: StyleTheme.textBoldTs
                    .copyWith(color: ColorTheme.primaryColor, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.2,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorTheme.whiteColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: List.generate(
                        controller.peopleBuyPostDataList.length,
                        (index) => PostItem(
                          postData: controller.peopleBuyPostDataList[index],
                          index: index,
                          onTap: () => controller.tapPost(
                              controller.peopleBuyPostDataList[index],
                              index,
                              false),
                          isAuthor: false,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
