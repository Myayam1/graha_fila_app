import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:grafil_app/pages/authentication/login/loginmodel.dart';
import 'package:grafil_app/pages/authentication/login/loginservices.dart';
import '../routes/app_route.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  void autoFillLogin() {
    emailController.text = "";
    passwordController.text = "";
  }

  bool _isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email dan Password wajib diisi');
      return;
    }

    if (!_isValidEmail(email)) {
      Get.snackbar('Format Salah', 'Masukkan email yang valid');
      return;
    }

    final loginData = LoginModel(email: email, password: password);

    isLoading.value = true; 

    try {
      final response = await LoginService.login(loginData);
      print('Status: ${response.statusCode}');
      print('Body: ${response.body}');

      if (response.statusCode == 201) {
        final data = json.decode(response.body);

        if (data['token'] != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', data['token']);
        }

        Get.snackbar('Berhasil', 'Login berhasil');
        Get.offAllNamed(AppRoutes.dashboardReservasi);
      } else {
        final error = json.decode(response.body);
        Get.snackbar('Login Gagal', error['message'] ?? 'Cek kembali email dan password');
      }
    } catch (e) {
      Get.snackbar('Error', 'Tidak dapat terhubung ke server');
      print('Exception: $e');
    } finally {
      isLoading.value = false; 
    }
  }
}

