import 'package:grafil_app/pages/authentication/register/registermodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class RegisterService {
  static Future<http.Response> register(RegisterModel data) {
    return http.post(
      Uri.parse('https://0cfa-2404-c0-7450-00-537f-3a34.ngrok-free.app/api/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data.toJson()),
    );
  }
}
