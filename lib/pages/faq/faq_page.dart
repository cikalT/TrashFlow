import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/base/base_widget.dart';
import 'package:trashflow/routes/index.dart';
import 'package:trashflow/themes/index.dart';

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
        child: Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Image.asset('assets/images/trashflow_icon.png'),
        ),
      ),
    );
  }
}
