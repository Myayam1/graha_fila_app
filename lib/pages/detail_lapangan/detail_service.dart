import 'dart:convert';
import 'package:grafil_app/pages/detail_lapangan/model_reservasi.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class ReservationService {
  static const String url = 'https://2f16-114-10-5-49.ngrok-free.app/api/reservation';

  static Future<List<ReservationModel>> fetchReservations() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null) {
        throw Exception('No token found in SharedPreferences');
      }

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        print("API Response: ${response.body}");

        if (jsonData['reservations'] == null) {
          throw Exception('No reservations found in the API response');
        }

        final List<dynamic> reservations = jsonData['reservations'];
        return reservations.map((json) => ReservationModel.fromJson(json)).toList();
      } else {
        
        print('Failed to load reservations. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to load reservations. Status code: ${response.statusCode}');
      }
    } catch (e) {
      
      print('Error fetching reservations: $e');
      throw Exception('Failed to fetch reservations: $e');
    }
  }
}
