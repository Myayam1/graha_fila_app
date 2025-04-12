import 'package:get/get.dart';
import 'package:grafil_app/controllers/verificationcontroller.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationController>(() => VerificationController());
  }
}
