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

  Future<void> refreshData() async {
    await getReservations();
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
        return reservationDateTime
            .add(const Duration(minutes: 59))
            .isBefore(currentDateTime);
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
    // formattedDate sekarang dalam format "DD MMM YYYY" (contoh: "10 May 2025")
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
      // Convert dari "DD MMM YYYY" ke format YYYY-MM-DD untuk pencarian
      final parts = selectedDate.value!.split(' ');
      if (parts.length == 3) {
        final day = parts[0].padLeft(2, '0');
        
        // Convert bulan dari singkatan kembali ke nomor
        final monthMap = {
          'Jan': '01', 'Feb': '02', 'Mar': '03', 'Apr': '04',
          'May': '05', 'Jun': '06', 'Jul': '07', 'Aug': '08',
          'Sep': '09', 'Oct': '10', 'Nov': '11', 'Dec': '12'
        };
        
        final month = monthMap[parts[1]] ?? '01';
        final year = parts[2];
        
        final apiDateFormat = "$year-$month-$day";  // Format YYYY-MM-DD untuk API
        result = result
            .where((reservation) => reservation.tanggal == apiDateFormat)
            .toList();
      }
    }

    if (selectedSpotId.value != 0) {
      result = result
          .where(
            (reservasi) => int.parse(reservasi.lapangan) == selectedSpotId.value,
          )
          .toList();
    }

    if (searchQuery.value.isNotEmpty) {
      String query = searchQuery.value.toLowerCase();
      result = result.where((reservation) {
        return reservation.nama.toLowerCase().startsWith(query) ||
            reservation.telp.toLowerCase().startsWith(query);
      }).toList();
    }

    DateTime now = DateTime.now();
    result = result.where((reservation) {
      DateTime reservationDateTime = DateTime.parse(
        '${reservation.tanggal} ${reservation.waktu}',
      );
      return reservationDateTime
          .add(const Duration(minutes: 59))
          .isAfter(now);
    }).toList();

    return result;
  }

  void changeSpotFilter(int spotId) {
    selectedSpotId.value = spotId;
    update();
  }
}