import 'package:get/get.dart';

import 'package:grafil_app/controllers/newpassword_controller.dart';

class NewPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewPasswordController>(() => NewPasswordController());
  }
}
