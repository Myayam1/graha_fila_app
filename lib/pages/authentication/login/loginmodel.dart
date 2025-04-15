class LoginModel {
  final String email;
  final String password;

  LoginModel({required this.email, required this.password});

  Map<String, String> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}
