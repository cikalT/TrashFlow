import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/base/base_widget.dart';
import 'package:trashflow/routes/index.dart';
import 'package:trashflow/themes/index.dart';
import 'package:trashflow/widgets/custom_expansion_tile.dart';

import 'faq_controller.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FaqController>(
      init: FaqController(),
      builder: (controller) => BaseWidget(
        controller: controller,
        isLoading: controller.isLoading,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorTheme.primaryColor,
          toolbarHeight: 0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                elevation: 0,
                centerTitle: true,
                backgroundColor: ColorTheme.whiteColor,
                title: Text(
                  'FaQ',
                  style: StyleTheme.textBoldTs
                      .copyWith(color: ColorTheme.primaryColor, fontSize: 16),
                ),
                leading: IconButton(
                  splashRadius: 16,
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: ColorTheme.primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: List.generate(
                  controller.faqDataList.length,
                  (index) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: ColorTheme.primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CustomExpansionTile(
                        iconColor: ColorTheme.whiteColor,
                        title: Text(
                          controller.faqDataList[index]?.title ?? '',
                          textAlign: TextAlign.left,
                          style: StyleTheme.textBoldTs.copyWith(
                            color: ColorTheme.whiteColor,
                            fontSize: 16,
                          ),
                        ),
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Text(
                              controller.faqDataList[index]?.desc ?? '',
                              textAlign: TextAlign.start,
                              style: StyleTheme.textTs.copyWith(
                                color: ColorTheme.whiteColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
