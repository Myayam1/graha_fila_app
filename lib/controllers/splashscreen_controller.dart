import 'package:get/get.dart';
import 'dart:async';

import 'package:grafil_app/routes/app_route.dart';

class SplashController extends GetxController {
@override
void onInit() {
  super.onInit();
  print("SplashController loaded!"); 
  Future.delayed(const Duration(seconds: 2), () {
    print("Pindah ke Login..."); 
    Get.offNamed(AppRoutes.login);

  });
}

}


