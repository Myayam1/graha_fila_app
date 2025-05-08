import 'package:get/get.dart';
import 'package:grafil_app/pages/detail_lapangan/model_reservasi.dart';
import 'package:grafil_app/pages/detail_lapangan/detail_service.dart';

class RiwayatReservationController extends GetxController {
  var reservations = <ReservationModel>[].obs;
  var isLoading = false.obs;
  var selectedSpotId = 0.obs;
  var selectedDate = Rx<String?>(null);
  var selectedStartDate = Rx<DateTime?>(null);
  var selectedEndDate = Rx<DateTime?>(null);
  var searchQuery = ''.obs;
  var pastReservations = <ReservationModel>[].obs;
  var upcomingReservations = <ReservationModel>[].obs;

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

      pastReservations.value =
          reservations.where((reservation) {
            DateTime reservationDateTime = DateTime.parse(
              '${reservation.tanggal} ${reservation.waktu}',
            );
            DateTime endOfReservation = reservationDateTime.add(
              Duration(minutes: 59),
            );
            return endOfReservation.isBefore(currentDateTime);
          }).toList();

      upcomingReservations.value =
          reservations.where((reservation) {
            DateTime reservationDateTime = DateTime.parse(
              '${reservation.tanggal} ${reservation.waktu}',
            );
            DateTime endOfReservation = reservationDateTime.add(
              Duration(minutes: 59),
            );
            return endOfReservation.isAfter(currentDateTime);
          }).toList();

      pastReservations.sort((a, b) {
        DateTime aDateTime = DateTime.parse('${a.tanggal} ${a.waktu}');
        DateTime bDateTime = DateTime.parse('${b.tanggal} ${b.waktu}');
        return aDateTime.compareTo(bDateTime);
      });

      upcomingReservations.sort((a, b) {
        DateTime aDateTime = DateTime.parse('${a.tanggal} ${a.waktu}');
        DateTime bDateTime = DateTime.parse('${b.tanggal} ${b.waktu}');
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
    selectedStartDate.value = null;
    selectedEndDate.value = null;
    update();
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    update();
  }

  void setDateRange(String startDate, String endDate) {
    selectedDate.value = "$startDate - $endDate";
    selectedStartDate.value = parseDateFromUI(startDate);
    selectedEndDate.value = parseDateFromUI(endDate);
    update();
  }

  DateTime parseDateFromUI(String formattedDate) {
    final parts = formattedDate.split(' ');
    final day = int.parse(parts[0]);
    final month =
        [
          'Jan',
          'Feb',
          'Mar',
          'Apr',
          'May',
          'Jun',
          'Jul',
          'Aug',
          'Sep',
          'Oct',
          'Nov',
          'Dec',
        ].indexOf(parts[1]) +
        1;
    final year = int.parse(parts[2]);
    return DateTime(year, month, day);
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
    List<ReservationModel> result = pastReservations;
    print('Filtering with selectedDate: ${selectedDate.value}');

    if (selectedStartDate.value != null && selectedEndDate.value != null) {
      result =
          result.where((reservation) {
            DateTime reservationDate = DateTime.parse(reservation.tanggal);
            return reservationDate.isAfter(
                  selectedStartDate.value!.subtract(Duration(days: 1)),
                ) &&
                reservationDate.isBefore(
                  selectedEndDate.value!.add(Duration(days: 1)),
                );
          }).toList();
    }

    if (selectedDate.value != null &&
        selectedStartDate.value == null &&
        selectedEndDate.value == null &&
        selectedDate.value!.isNotEmpty) {
      final parts = selectedDate.value!.split(' ');
      if (parts.length == 3) {
        final day = parts[0].padLeft(2, '0');
        final monthMap = {
          'Jan': '01',
          'Feb': '02',
          'Mar': '03',
          'Apr': '04',
          'May': '05',
          'Jun': '06',
          'Jul': '07',
          'Aug': '08',
          'Sep': '09',
          'Oct': '10',
          'Nov': '11',
          'Dec': '12',
        };
        final month = monthMap[parts[1]] ?? '01';
        final year = parts[2];
        final apiDateFormat = "$year-$month-$day";
        print('Converted to API format: $apiDateFormat');

        result =
            result
                .where((reservation) => reservation.tanggal == apiDateFormat)
                .toList();
        print('Filtered by date result count: ${result.length}');
      } else {
        print('Invalid date format: ${selectedDate.value}');
      }
    }

    if (searchQuery.value.isNotEmpty) {
      String query = searchQuery.value.toLowerCase();
      result =
          result.where((reservation) {
            return reservation.nama.toLowerCase().contains(query) ||
                reservation.telp.toLowerCase().contains(query);
          }).toList();
    }

    if (selectedSpotId.value != 0) {
      result =
          result
              .where(
                (reservasi) =>
                    int.parse(reservasi.lapangan) == selectedSpotId.value,
              )
              .toList();
    }

    print('Final filtered result count: ${result.length}');
    return result;
  }

  void changeSpotFilter(int spotId) {
    selectedSpotId.value = spotId;
    update();
  }
}
