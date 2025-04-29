import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grafil_app/pages/authentication/register/registermodel.dart';
import 'package:grafil_app/pages/authentication/register/registerservice.dart';

class RegisterController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  var isLoading = false.obs;

  bool _isValidEmail(String email) {
    final regex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return regex.hasMatch(email);
  }

  Future<void> register() async {
    final String name = usernameController.text.trim();
    final String password = passwordController.text;
    final String email = emailController.text.trim();

    if (name.isEmpty || password.isEmpty || email.isEmpty) {
      Get.snackbar('Gagal', 'Semua field wajib diisi');
      return;
    }

    if (password.length < 8) {
      Get.snackbar('Gagal', 'Password harus memiliki minimal 8 karakter');
      return;
    }

    if (!_isValidEmail(email)) {
      Get.snackbar('Gagal', 'Email tidak valid');
      return;
    }

    final registerData = RegisterModel(name: name, email: email, password: password);
    isLoading.value = true;

    try {
      final response = await RegisterService.register(registerData);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final decoded = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201 ) {
        Get.snackbar('Berhasil', decoded['message'] ?? 'Registrasi berhasil');
        clearFields();
        Get.toNamed('/login');
      } else if (response.statusCode == 422 && decoded['errors'] != null) {
        final errors = decoded['errors'] as Map<String, dynamic>;
        final messages = errors.entries
            .map((entry) => '${entry.value[0]}')
            .join('\n');
        Get.snackbar('Gagal', messages);
      } else {
        Get.snackbar('Gagal', decoded['message'] ?? 'Terjadi kesalahan');
      }
    } catch (e) {
      print('Exception: $e');
      Get.snackbar('Error', 'Gagal terhubung ke server');
    } finally {
      isLoading.value = false;
    }
  }

  void clearFields() {
    usernameController.clear();
    passwordController.clear();
    emailController.clear();
    phoneController.clear();
  }

  @override
  void onInit() {
    super.onInit();
    clearFields();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
