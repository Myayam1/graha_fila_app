import 'dart:convert';
import 'package:grafil_app/API_config.dart';
import 'package:grafil_app/pages/dashboard/totalPendapatan/model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class PaymentService {
  final String baseUrl = ApiConfig.baseUrl; 

  Future<PaymentModel> getTodayIncome(String date) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null) {
        throw Exception('Anda belum login');
      }

      final response = await http.get(
        Uri.parse('$baseUrl/api/payment?sum=true&date=$date'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return PaymentModel.fromJson(data);
      } else {
        throw Exception('Gagal memuat data pendapatan: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}