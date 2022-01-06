import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/base/base_widget.dart';
import 'package:trashflow/themes/index.dart';
import 'package:trashflow/widgets/custom_raised_button.dart';

import '../home_controller.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({Key? key}) : super(key: key);

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
                'Profile',
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: ColorTheme.primaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(
                              controller.profileGoogle?.photoUrl ?? ''),
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.profileGoogle?.displayName ?? '',
                              style: StyleTheme.textBoldTs.copyWith(
                                  color: ColorTheme.whiteColor, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              controller.profileGoogle?.email ?? '',
                              style: StyleTheme.textBoldTs.copyWith(
                                  color: ColorTheme.whiteColor, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              controller.profileData?.phone ??
                                  '*You have not set phone number!',
                              style: StyleTheme.textBoldTs.copyWith(
                                  color: ColorTheme.whiteColor, fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomRaisedButton(
                    radius: 16,
                    padding: const EdgeInsets.all(12),
                    textStyle: StyleTheme.textBoldTs
                        .copyWith(color: ColorTheme.whiteColor, fontSize: 16),
                    label: 'Edit Profile',
                    color: ColorTheme.primaryColor,
                    onPressed: () {
                      controller.tapEditProfile();
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  InkWell(
                    onTap: () {
                      controller.tapFaq();
                    },
                    splashColor: ColorTheme.primaryColor,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ColorTheme.newBoxColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/question.svg'),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Frequently Asked Question (FAQ)',
                            style: StyleTheme.textTs.copyWith(
                                color: ColorTheme.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 160,
                  ),
                  CustomRaisedButton(
                    radius: 16,
                    padding: const EdgeInsets.all(12),
                    textStyle: StyleTheme.textBoldTs
                        .copyWith(color: ColorTheme.whiteColor, fontSize: 16),
                    label: 'Log Out',
                    color: ColorTheme.primaryColor,
                    onPressed: () {
                      controller.tapProfileLogOut();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
