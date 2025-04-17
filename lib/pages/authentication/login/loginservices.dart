import 'package:grafil_app/pages/authentication/login/loginmodel.dart';
import 'package:http/http.dart' as http;


class LoginService {
  static Future<http.Response> login(LoginModel data) {
    return http.post(
      Uri.parse('https://0cfa-2404-c0-7450-00-537f-3a34.ngrok-free.app/api/login'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: data.toMap(),
    );
  }
}
