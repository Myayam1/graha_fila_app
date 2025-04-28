import 'package:grafil_app/pages/authentication/register/registermodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class RegisterService {
  static Future<http.Response> register(RegisterModel data) {
    return http.post(
      Uri.parse('https://a018-160-22-25-43.ngrok-free.app/api/register'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        
        },
      body: json.encode(data.toJson()),
    );
  }
}
