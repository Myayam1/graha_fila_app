class PaymentModel {
  final String amount;

  PaymentModel({required this.amount});

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(amount: json['payments'].toString());
  }
}
