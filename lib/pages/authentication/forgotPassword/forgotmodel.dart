class ForgotPasswordResponse {
  final String message;
  final int? code;

  ForgotPasswordResponse({required this.message, this.code});

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponse(
      message: json['message'],
      code: json['code'],
    );
  }
}
