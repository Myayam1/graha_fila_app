import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grafil_app/pages/authentication/register/registermodel.dart';
import 'package:grafil_app/pages/authentication/register/registerservice.dart';

import 'dart:convert';

class RegisterController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController(); 

  bool _isValidEmail(String email) {
    final regex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return regex.hasMatch(email);
  }

  Future<void> register() async {
    final String name = usernameController.text;
    final String password = passwordController.text;
    final String email = emailController.text;

    if (name.isEmpty || password.isEmpty || email.isEmpty) {
      Get.snackbar('Error', 'Semua field wajib diisi');
      return;
    }

    if (password.length < 8) {
      Get.snackbar('Error', 'Password harus memiliki minimal 8 karakter');
      return;
    }

    if (!_isValidEmail(email)) {
      Get.snackbar('Error', 'Email tidak valid');
      return;
    }

    final registerData = RegisterModel(name: name, email: email, password: password);

    try {
      final response = await RegisterService.register(registerData);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        Get.snackbar('Berhasil', data['message']);
        Get.toNamed('/login');
      } else {
        try {
          final error = json.decode(response.body);
          Get.snackbar('Gagal', error['message'] ?? 'Terjadi kesalahan');
        } catch (e) {
          Get.snackbar('Gagal', 'Terjadi kesalahan pada server');
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal terhubung ke server');
      print(e);
    }
  }
}
