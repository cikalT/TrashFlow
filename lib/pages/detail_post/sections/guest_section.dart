import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/routes/index.dart';
import 'package:trashflow/themes/index.dart';
import 'package:trashflow/widgets/custom_container.dart';

import '../detail_post_controller.dart';

class GuestSection extends StatelessWidget {
  const GuestSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPostController>(
      builder: (controller) => Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (!controller.isLoading)
            AspectRatio(
                aspectRatio: 16 / 9,
                child: CachedNetworkImage(
                    imageUrl: controller.postData?.image ?? '')),
          const SizedBox(
            height: 16,
          ),
          CustomContainer(
              padding: const EdgeInsets.all(16),
              height: 260,
              backgroundColor: ColorTheme.primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.postData?.title ?? '',
                    style: StyleTheme.textBoldTs
                        .copyWith(color: ColorTheme.whiteColor, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        'Price: \$ ',
                        style: StyleTheme.textBoldTs.copyWith(
                            color: ColorTheme.whiteColor, fontSize: 16),
                      ),
                      Text(
                        controller.postData?.price.toString() ?? '',
                        style: StyleTheme.textBoldTs.copyWith(
                            color: ColorTheme.whiteColor, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Category',
                    style: StyleTheme.textBoldTs
                        .copyWith(color: ColorTheme.whiteColor, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorTheme.whiteColor),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      controller.postData?.categories?.first?.name ?? '',
                      style: StyleTheme.textTs
                          .copyWith(color: ColorTheme.whiteColor, fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Description',
                    style: StyleTheme.textBoldTs
                        .copyWith(color: ColorTheme.whiteColor, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    controller.postData?.description ?? '',
                    style: StyleTheme.textTs
                        .copyWith(color: ColorTheme.whiteColor, fontSize: 16),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
