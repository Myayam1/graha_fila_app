import 'dart:convert';
import 'package:grafil_app/pages/authentication/forgotPassword/forgotmodel.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordService {
  static const baseUrl =
      'https://5e00-103-164-229-141.ngrok-free.app/api/password';

  // === Request Kode Verifikasi ===
  static Future<ForgotPasswordResponse> requestCode(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/request-code'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ForgotPasswordResponse.fromJson(data);
    } else {
      final message = data['message'] ?? 'Terjadi kesalahan saat mengirim kode';
      throw Exception(message);
    }
  }

  // === Reset Password ===
  static Future<ForgotPasswordResponse> resetPassword({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/reset'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ForgotPasswordResponse.fromJson(data);
    } else {
      final message = data['message'] ?? 'Gagal reset password';
      throw Exception(message);
    }
  }

  // === Validasi Kode OTP ===
  static Future<ForgotPasswordResponse> validateCode({
    required String email,
    required String code,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/validate-code'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'code': code}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ForgotPasswordResponse.fromJson(data);
    } else {
      final message =
          data['message'] ?? 'Kode verifikasi salah atau kadaluarsa';
      throw Exception(message);
    }
  }
}
