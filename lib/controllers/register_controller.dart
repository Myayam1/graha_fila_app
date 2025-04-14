import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

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

    try {
      final response = await http.post(
        Uri.parse('https://6a41-103-164-229-141.ngrok-free.app/api/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'name': name, 'email': email, 'password': password}),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        Get.snackbar('Berhasil', data['message']);
        Get.toNamed('/login');
      } else {
        final error = json.decode(response.body);
        Get.snackbar('Gagal', error['message'] ?? 'Terjadi kesalahan');
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal terhubung ke server');
      print(e);
    }
  }
}
