import 'package:get/get.dart';
import 'package:grafil_app/controllers/splashscreen_controller.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
