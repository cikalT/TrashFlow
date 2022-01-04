import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/base/base_widget.dart';
import 'package:trashflow/routes/index.dart';
import 'package:trashflow/themes/index.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:trashflow/widgets/custom_auth_button.dart';

import 'auth_controller.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) => BaseWidget(
        controller: controller,
        isLoading: controller.isLoading,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorTheme.primaryColor,
          toolbarHeight: 0,
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/trashflow_icon.png',
                width: 280,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Welcome to TrashFlow',
                style: StyleTheme.subHeaderTs
                    .copyWith(color: ColorTheme.primaryColor, fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'The Solution to conserve our\nenvironment and at the same time\nturn our trash to money',
                style: StyleTheme.textTs
                    .copyWith(color: ColorTheme.primaryColor, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 80,
              ),
              CustomAuthButton(
                Buttons.Google,
                backgroundColor: ColorTheme.primaryColor,
                textColor: ColorTheme.whiteColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                text: "Continue with Google",
                onPressed: () {
                  controller.tapContinueGoogle();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
