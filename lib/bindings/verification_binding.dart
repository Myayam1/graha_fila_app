import 'package:get/get.dart';
import 'package:grafil_app/controllers/verification_controller.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifficationController>(() => VerifficationController());
  }
}
