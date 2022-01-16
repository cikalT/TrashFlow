import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/models/index.dart';
import 'package:trashflow/themes/index.dart';
import 'package:trashflow/widgets/custom_container.dart';

class PostItem extends StatelessWidget {
  final PostData? postData;
  final int index;
  final Function() onTap;
  final bool isAuthor;

  const PostItem(
      {Key? key,
      required this.postData,
      required this.index,
      required this.onTap,
      required this.isAuthor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomContainer(
          child: Stack(
            children: [
              if (isAuthor)
                Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.topRight,
                  child: postData!.type == 'SELL'
                      ? Icon(
                          CupertinoIcons.money_dollar,
                          color: ColorTheme.primaryColor,
                        )
                      : postData!.type == 'BUY'
                          ? Icon(
                              CupertinoIcons.cart_fill,
                              color: ColorTheme.primaryColor,
                            )
                          : Container(),
                ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 88,
                    width: 88,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: postData?.image ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 180,
                          child: SingleChildScrollView(
                            child: Text(
                              postData?.title ?? '',
                              style: StyleTheme.textBoldTs.copyWith(
                                  color: ColorTheme.primaryColor, fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        Text(
                          '\$ ${postData?.price.toString() ?? '0'}',
                          style: StyleTheme.textBoldTs.copyWith(
                              color: ColorTheme.primaryColor, fontSize: 14),
                        ),
                        Row(
                          children: [
                            Text(
                              'Category: ',
                              style: StyleTheme.textTs
                                  .copyWith(color: ColorTheme.primaryColor),
                            ),
                            Text(
                              postData?.categories?.first?.name ?? '',
                              style: StyleTheme.textTs
                                  .copyWith(color: ColorTheme.primaryColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Posted By: ',
                              style: StyleTheme.textTs
                                  .copyWith(color: ColorTheme.primaryColor),
                            ),
                            Text(
                              isAuthor ? 'Me' : postData?.author?.name ?? 'Me',
                              style: StyleTheme.textTs
                                  .copyWith(color: ColorTheme.primaryColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
