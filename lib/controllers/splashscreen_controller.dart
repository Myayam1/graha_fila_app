import 'package:get/get.dart';
import 'dart:async';

import 'package:grafil_app/routes/app_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print("SplashController loaded!");
    
    Future.delayed(const Duration(seconds: 2), () async {
      print("Checking login status...");

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token != null && token.isNotEmpty) {
        print("User is already logged in. Navigating to Dashboard...");
        Get.offAllNamed(AppRoutes.dashboardLapangan);
      } else {
        print("No token found. Navigating to Login...");
        Get.offAllNamed(AppRoutes.login);
      }
    });
  }
}



