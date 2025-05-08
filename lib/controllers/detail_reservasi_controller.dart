import 'package:get/get.dart';
import 'package:grafil_app/pages/detail_lapangan/model_reservasi.dart';
import 'package:grafil_app/pages/detail_lapangan/detail_service.dart';

class DetailReservationController extends GetxController {
  var reservations = <ReservationModel>[].obs;
  var isLoading = false.obs;
  var selectedSpotId = 0.obs;
  var selectedDate = Rx<String?>(null);
  var selectedStartDate = Rx<DateTime?>(null);
  var selectedEndDate = Rx<DateTime?>(null);
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


  String formatDateToUI(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final monthAbbr = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ][date.month - 1];
    final year = date.year.toString();
    return '$day $monthAbbr $year';
  }

  DateTime parseDateFromUI(String formattedDate) {
    final parts = formattedDate.split(' ');
    final day = int.parse(parts[0]);
    final month = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ].indexOf(parts[1]) + 1;
    final year = int.parse(parts[2]);
    return DateTime(year, month, day);
  }

  void setDateRange(String startDate, String endDate) {
    selectedDate.value = "$startDate - $endDate";
    selectedStartDate.value = parseDateFromUI(startDate);
    selectedEndDate.value = parseDateFromUI(endDate);
    update();
  }

  void clearDateFilter() {
    selectedDate.value = null;
    selectedStartDate.value = null;
    selectedEndDate.value = null;
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

    if (selectedStartDate.value != null && selectedEndDate.value != null) {
      result = result.where((reservation) {
        DateTime reservationDate = DateTime.parse(reservation.tanggal);
        return reservationDate.isAfter(selectedStartDate.value!.subtract(const Duration(days: 1))) &&
               reservationDate.isBefore(selectedEndDate.value!.add(const Duration(days: 1)));
      }).toList();
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
