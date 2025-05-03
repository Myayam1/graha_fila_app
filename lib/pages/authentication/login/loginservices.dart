import 'package:grafil_app/API_config.dart';
import 'package:grafil_app/pages/authentication/login/loginmodel.dart';
import 'package:http/http.dart' as http;


class LoginService {
  static Future<http.Response> login(LoginModel data) {
    return http.post(
      Uri.parse(ApiConfig.baseUrl + '/api/login'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: data.toMap(),
    );
  }
}
