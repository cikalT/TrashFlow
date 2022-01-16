import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/themes/index.dart';
import 'package:trashflow/widgets/custom_text_field.dart';
import 'package:trashflow/widgets/post_item.dart';

import '../home_controller.dart';

class BuySection extends StatelessWidget {
  const BuySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        color: ColorTheme.boxColor,
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
                'People who sell some trash',
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
                    CustomTextField(
                      controller: controller.fieldSearch,
                      hintText: 'Search',
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: ColorTheme.primaryColor,
                      ),
                      filledColor: ColorTheme.boxColor,
                      labelColor: ColorTheme.primaryColor,
                      filledTextColor: ColorTheme.primaryColor,
                      borderedMode: false,
                      transparencyMode: true,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        controller.filterPost(value, controller.currentIndex);
                      },
                    ),
                    if (controller.peopleSellPostDataList.isEmpty)
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 120,
                            ),
                            Image.asset(
                              'assets/images/no_data.png',
                              width: 140,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'No Post',
                              style: StyleTheme.textTs.copyWith(
                                  color: ColorTheme.primaryColor, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    if (controller.peopleSellPostDataList.isNotEmpty)
                      Column(
                        children: List.generate(
                          controller.peopleSellPostDataList.length,
                          (index) => PostItem(
                            postData: controller.peopleSellPostDataList[index],
                            index: index,
                            onTap: () => controller.tapPost(
                                controller.peopleSellPostDataList[index],
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
