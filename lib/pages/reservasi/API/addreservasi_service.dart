import 'package:get/get.dart';
import 'package:grafil_app/API_config.dart';
import 'package:grafil_app/pages/reservasi/API/addreservasi_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AddReservationService extends GetxService {
  final String baseUrl = ApiConfig.baseUrl;

  Future<List<AddReservationModel>> getAllReservations() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/api/reservation'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> reservationsJson = data['reservations'];
        return reservationsJson
            .map((json) => AddReservationModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load reservations: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching reservations: $e');
    }
  }

  Future<List<String>> getReservationTimes(String date, int spotId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.get(
        Uri.parse('$baseUrl/api/reservation?date=$date&spot_id=$spotId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print("API Response: ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        print("Data structure: ${data.keys}");

        if (data.containsKey('reservation_times')) {
          if (data['reservation_times'] == null) {
            return [];
          }
          final List<dynamic> reservationTimes = data['reservation_times'];
          return reservationTimes.cast<String>();
        } else {
          print("Available keys in response: ${data.keys.toList()}");

          final possibleKeys = ['times', 'slots', 'bookings', 'reservations'];
          for (var key in possibleKeys) {
            if (data.containsKey(key) && data[key] is List) {
              final List<dynamic> times = data[key];
              return times.cast<String>();
            }
          }

          return [];
        }
      } else {
        throw Exception(
          'Failed to load reservation times: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error fetching reservation times: $e');
    }
  }

  Future<AddReservationModel> createReservation(
    AddReservationModel reservation,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.post(
        Uri.parse('$baseUrl/api/reservation'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(reservation.toJson()),
      );
      print(json.encode(reservation.toJson()));
      print("Status Code: ${response.statusCode}");
      print("Raw Response: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data.containsKey('reservation')) {
          return AddReservationModel.fromJson(data['reservation']);
        } else {
          return reservation;
        }
      } else {
        throw Exception('Failed to create reservation: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error creating reservation: $e');
    }
  }
}
