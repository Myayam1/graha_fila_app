import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grafil_app/pages/authentication/forgotPassword/forgotservice.dart';
import 'package:grafil_app/routes/app_route.dart';

class NewPasswordController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String email = '';
  String code = '';

  void setEmailAndCode({required String email, required String code}) {
    this.email = email;
    this.code = code;
  }

  Future<void> resetPassword() async {
    if (passwordController.text.length < 8) {
      Get.snackbar("Error", "Password minimal 8 karakter");
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Password tidak sama");
      return;
    }

    try {
      final response = await ForgotPasswordService.resetPassword(
        email: email,
        password: passwordController.text,
      );
      Get.snackbar("Sukses", response.message);
      Get.offAllNamed(AppRoutes.login); 
    } catch (e) {
      Get.snackbar("Error", "Gagal reset password: $e");
    }
  }
}
