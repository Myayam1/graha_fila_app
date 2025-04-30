import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:grafil_app/pages/detail_lapangan/detail_service.dart';
import 'package:grafil_app/pages/detail_lapangan/model_reservasi.dart';

class DetailReservationController extends GetxController {
  var reservations = <ReservationModel>[].obs;
  var isLoading = false.obs;
  var selectedSpotId = 0.obs;
  var selectedDate = Rx<String?>(null);

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
        return reservationDateTime.isBefore(currentDateTime);
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
          .where((reservasi) => int.parse(reservasi.lapangan) == selectedSpotId.value)
          .toList();
    }

   
    DateTime now = DateTime.now();
    result = result.where((reservation) {
      DateTime reservationDateTime = DateTime.parse(
        '${reservation.tanggal} ${reservation.waktu}',
      );

      
      if (reservationDateTime.year == now.year &&
          reservationDateTime.month == now.month &&
          reservationDateTime.day == now.day) {
        return reservationDateTime.isAfter(now);
      }

      
      return true;
    }).toList();

    return result;
  }

  void changeSpotFilter(int spotId) {
    selectedSpotId.value = spotId;
    update();
  }
}
