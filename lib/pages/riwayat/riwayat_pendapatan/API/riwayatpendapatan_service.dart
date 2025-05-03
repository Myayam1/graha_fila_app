import 'dart:convert';
import 'package:grafil_app/API_config.dart';
import 'package:grafil_app/pages/riwayat/riwayat_pendapatan/API/riwayatpendapatan_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class RiwayatPendapatanService {
  static const String baseUrl = ApiConfig.baseUrl; 

  // Mendapatkan semua riwayat pendapatan
  Future<List<RiwayatPendapatanModel>> getPayments() async {
    try {

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.get(Uri.parse('$baseUrl/api/payment'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('payments')) {
          final List<dynamic> payments = data['payments'];
          return payments.map((payment) => RiwayatPendapatanModel.fromJson(payment)).toList();
        }
        return [];
      } else {
        throw Exception('Gagal memuat data pendapatan');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Mendapatkan riwayat pendapatan berdasarkan tanggal
  Future<List<RiwayatPendapatanModel>> getPaymentsByDate(String date) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.get(Uri.parse('$baseUrl/api/payment?date=$date'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('payments')) {
          final List<dynamic> payments = data['payments'];
          return payments.map((payment) => RiwayatPendapatanModel.fromJson(payment)).toList();
        }
        return [];
      } else {
        throw Exception('Gagal memuat data pendapatan berdasarkan tanggal');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Mendapatkan riwayat pendapatan berdasarkan nomor lapangan
  Future<List<RiwayatPendapatanModel>> getPaymentsByLapangan(int spotId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.get(Uri.parse('$baseUrl/api/payment?spot_id=$spotId'),
      headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('payments')) {
          final List<dynamic> payments = data['payments'];
          return payments.map((payment) => RiwayatPendapatanModel.fromJson(payment)).toList();
        }
        return [];
      } else {
        throw Exception('Gagal memuat data pendapatan berdasarkan lapangan');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Mencari riwayat pendapatan berdasarkan nama
  Future<List<RiwayatPendapatanModel>> searchPayments(String keyword) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/payment?search=$keyword'));
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data.containsKey('payments')) {
          final List<dynamic> payments = data['payments'];
          return payments.map((payment) => RiwayatPendapatanModel.fromJson(payment)).toList();
        }
        return [];
      } else {
        throw Exception('Gagal mencari data pendapatan');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}