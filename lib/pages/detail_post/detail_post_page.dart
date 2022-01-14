import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/base/base_widget.dart';
import 'package:trashflow/routes/index.dart';
import 'package:trashflow/themes/index.dart';
import 'package:trashflow/widgets/custom_raised_button.dart';

import 'detail_post_controller.dart';
import 'sections/author_section.dart';
import 'sections/guest_section.dart';

class DetailPostPage extends StatelessWidget {
  const DetailPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPostController>(
      init: DetailPostController(),
      builder: (controller) => BaseWidget(
        controller: controller,
        isLoading: controller.isLoading,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorTheme.primaryColor,
          toolbarHeight: 0,
        ),
        bottomNavigationBar: Transform.translate(
          offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            color: ColorTheme.primaryColor,
            padding: const EdgeInsets.all(16),
            child: CustomRaisedButton(
              loading: controller.isButtonLoading,
              radius: 16,
              padding: const EdgeInsets.all(12),
              textStyle: StyleTheme.textBoldTs
                  .copyWith(color: ColorTheme.primaryColor, fontSize: 16),
              label: controller.buttonPage,
              color: ColorTheme.whiteColor,
              onPressed: () {
                controller.tapButtonPost();
              },
            ),
          ),
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: AppBar(
                  elevation: 0,
                  centerTitle: true,
                  backgroundColor: ColorTheme.whiteColor,
                  title: Text(
                    controller.titlePage,
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
                  actions: [
                    if (controller.isAuthor)
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: ColorTheme.primaryColor,
                        ),
                        onPressed: () {
                          controller.tapDeletePost();
                        },
                      )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              if (!controller.isLoading)
                SingleChildScrollView(
                  child: controller.isAuthor
                      ? const AuthorSection()
                      : const GuestSection(),
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
