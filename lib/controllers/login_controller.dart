import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grafil_app/pages/authentication/login/loginmodel.dart';
import 'package:grafil_app/pages/authentication/login/loginservices.dart';
import 'dart:convert';
import '../routes/app_route.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void autoFillLogin() {
    emailController.text = ""; 
    passwordController.text = "";
  }

  Future<void> login() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Username dan Password wajib diisi');
      return;
    }

    final loginData = LoginModel(email: email, password: password);

    try {
      final response = await LoginService.login(loginData);
      print('Status: ${response.statusCode}');
      print('Body: ${response.body}');

      if (response.statusCode == 201) {
        
        final data = json.decode(response.body);
        Get.snackbar('Berhasil', 'Login berhasil');
        Get.offAllNamed(AppRoutes.dashboardLapangan); 
      } else {
        final error = json.decode(response.body);
        Get.snackbar('Login Gagal', error['message'] ?? 'Cek kembali username/password');
      }
    } catch (e) {
      Get.snackbar('Error', 'Tidak dapat terhubung ke server');
      print(e);
    }
  }
}
