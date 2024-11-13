import 'package:get/get.dart';

import '../controllers/side_menu_controller.dart';

class SideMenuBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SideMenuController>(
      () => SideMenuController(),
    );
  }
}
