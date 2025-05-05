import 'package:get/get.dart';
import 'package:grafil_app/pages/detail_lapangan/detail_service.dart';
import 'package:grafil_app/pages/detail_lapangan/model_reservasi.dart';

class DetailReservationController extends GetxController {
  var reservations = <ReservationModel>[].obs;
  var isLoading = false.obs;
  var selectedSpotId = 0.obs;
  var selectedDate = Rx<String?>(null);
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getReservations();
  }

  Future<void> getReservations() async {
    try {
      isLoading.value = true;
      final result = await ReservationService.fetchReservations();
      reservations.value = result;

      DateTime currentDateTime = DateTime.now();
      reservations.removeWhere((reservation) {
        DateTime reservationDateTime = DateTime.parse(
          '${reservation.tanggal} ${reservation.waktu}',
        );
        return reservationDateTime.add(const Duration(minutes: 59)).isBefore(currentDateTime);
      });

      reservations.sort((reservationA, reservationB) {
        DateTime aDateTime = DateTime.parse(
          '${reservationA.tanggal} ${reservationA.waktu}',
        );
        DateTime bDateTime = DateTime.parse(
          '${reservationB.tanggal} ${reservationB.waktu}',
        );
        return aDateTime.compareTo(bDateTime);
      });
    } catch (e) {
      print("Controller error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void filterByDate(String formattedDate) {
    selectedDate.value = formattedDate;
    update();
  }

  void clearDateFilter() {
    selectedDate.value = null;
    update();
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    update();
  }
  String formatTimeRange(String startTime) {
    
    final timeParts = startTime.split(':');
    if (timeParts.length != 2) return startTime;
    
    int hour = int.tryParse(timeParts[0]) ?? 0;
    int minute = int.tryParse(timeParts[1]) ?? 0;
    

    int endHour = hour + 1;
    if (endHour >= 24) endHour = 0; 
  
    String formattedStartHour = hour.toString().padLeft(2, '0');
    String formattedEndHour = endHour.toString().padLeft(2, '0');
    String formattedMinute = minute.toString().padLeft(2, '0');
    
   
    return "$formattedStartHour:$formattedMinute - $formattedEndHour:$formattedMinute";
  }

  List<ReservationModel> get filteredReservations {
    List<ReservationModel> result = reservations;

   
    if (selectedDate.value != null && selectedDate.value!.isNotEmpty) {
      final parts = selectedDate.value!.split('-');
      if (parts.length == 3) {
        final apiDateFormat = "${parts[2]}-${parts[1]}-${parts[0]}";
        result = result
            .where((reservation) => reservation.tanggal == apiDateFormat)
            .toList();
      }
    }

    if (selectedSpotId.value != 0) {
      result = result
          .where((reservasi) =>
              int.parse(reservasi.lapangan) == selectedSpotId.value)
          .toList();
    }

  
    if (searchQuery.value.isNotEmpty) {
      String query = searchQuery.value.toLowerCase();
      result = result.where((reservation) {
        return reservation.nama.toLowerCase().contains(query) ||
            reservation.telp.toLowerCase().contains(query);
      }).toList();
    }

    
    DateTime now = DateTime.now();
    result = result.where((reservation) {
      DateTime reservationDateTime = DateTime.parse(
        '${reservation.tanggal} ${reservation.waktu}',
      );
      return reservationDateTime.add(const Duration(minutes: 59)).isAfter(now);
    }).toList();

    return result;
  }

  void changeSpotFilter(int spotId) {
    selectedSpotId.value = spotId;
    update();
  }
}
