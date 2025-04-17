import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grafil_app/pages/authentication/forgotPassword/forgotservice.dart';
import 'package:grafil_app/routes/app_route.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();

  Future<void> sendResetCode() async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar("Error", "Email tidak boleh kosong");
      return;
    }

    try {
      final response = await ForgotPasswordService.requestCode(email);
      Get.snackbar("Sukses", response.message);

      if (response.code != null) {
      print('Kode OTP: ${response.code}');
    }

      Get.toNamed(AppRoutes.verification, arguments: email);
    } catch (e) {
      Get.snackbar("Error", e.toString().replaceAll("Exception: ", ""));
    }
  }
}
