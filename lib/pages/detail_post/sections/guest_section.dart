import 'package:get/get.dart';
import 'package:trashflow/base/base_controller.dart';
import 'package:trashflow/routes/index.dart';

import '../detail_post_controller.dart';

class GuestSection extends StatelessWidget {
  const GuestSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPostController>(
      builder: (controller) => Column(
        mainAxisSize: MainAxisSize.max,
        children: [],
      ),
    );
  }
}
