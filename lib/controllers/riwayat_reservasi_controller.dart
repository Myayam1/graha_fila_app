import 'package:get/get.dart';
import 'package:grafil_app/pages/detail_lapangan/model_reservasi.dart';
import 'package:grafil_app/pages/detail_lapangan/detail_service.dart';

// class RiwayatReservationController extends GetxController {
//   var reservations = <ReservationModel>[].obs;
//   var isLoading = false.obs;
//   var selectedSpotId = 0.obs;
//   var selectedDate = Rx<String?>(null);

//   var pastReservations = <ReservationModel>[].obs;
//   var upcomingReservations = <ReservationModel>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     getReservations();
//   }

//   Future<void> getReservations() async {
//     try {
//       isLoading.value = true;
//       final result = await ReservationService.fetchReservations();
//       reservations.value = result;

//       DateTime currentDateTime = DateTime.now();

//       // Separate past and upcoming reservations
//       pastReservations.value = reservations.where((reservation) {
//         DateTime reservationDateTime = DateTime.parse(
//           '${reservation.tanggal} ${reservation.waktu}',
//         );
//         return reservationDateTime.isBefore(currentDateTime);
//       }).toList();

//       upcomingReservations.value = reservations.where((reservation) {
//         DateTime reservationDateTime = DateTime.parse(
//           '${reservation.tanggal} ${reservation.waktu}',
//         );
//         return reservationDateTime.isAfter(currentDateTime);
//       }).toList();

//       // Sort past and upcoming reservations
//       pastReservations.sort((reservationA, reservationB) {
//         DateTime aDateTime = DateTime.parse(
//           '${reservationA.tanggal} ${reservationA.waktu}',
//         );
//         DateTime bDateTime = DateTime.parse(
//           '${reservationB.tanggal} ${reservationB.waktu}',
//         );
//         return aDateTime.compareTo(bDateTime);
//       });

//       upcomingReservations.sort((reservationA, reservationB) {
//         DateTime aDateTime = DateTime.parse(
//           '${reservationA.tanggal} ${reservationA.waktu}',
//         );
//         DateTime bDateTime = DateTime.parse(
//           '${reservationB.tanggal} ${reservationB.waktu}',
//         );
//         return aDateTime.compareTo(bDateTime);
//       });

//     } catch (e) {
//       print("Controller error: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void filterByDate(String formattedDate) {
//     selectedDate.value = formattedDate;
//     update();
//   }

//   void clearDateFilter() {
//     selectedDate.value = null;
//     update();
//   }

//   List<ReservationModel> get filteredReservations {
//     List<ReservationModel> result = pastReservations;

//     if (selectedDate.value != null && selectedDate.value!.isNotEmpty) {
//       final parts = selectedDate.value!.split('-');
//       if (parts.length == 3) {
//         final apiDateFormat = "${parts[2]}-${parts[1]}-${parts[0]}";

//         result = result
//             .where((reservation) => reservation.tanggal == apiDateFormat)
//             .toList();
//       }
//     }

//     if (selectedSpotId.value != 0) {
//       result = result
//           .where(
//             (reservasi) =>
//                 int.parse(reservasi.lapangan) == selectedSpotId.value,
//           )
//           .toList();
//     }

//     return result;
//   }

//   void changeSpotFilter(int spotId) {
//     selectedSpotId.value = spotId;
//     update();
//   }
// }



class RiwayatReservationController extends GetxController {
  var reservations = <ReservationModel>[].obs;
  var isLoading = false.obs;
  var selectedSpotId = 0.obs;
  var selectedDate = Rx<String?>(null);
   var searchQuery = ''.obs; 
  var pastReservations = <ReservationModel>[].obs;
  var upcomingReservations = <ReservationModel>[].obs;

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

      // Separate past and upcoming reservations
      pastReservations.value = reservations.where((reservation) {
        DateTime reservationDateTime = DateTime.parse(
          '${reservation.tanggal} ${reservation.waktu}',
        );

        // Kalau tanggal reservasi sebelum hari ini, tampilkan
        if (reservationDateTime.isBefore(
          DateTime(currentDateTime.year, currentDateTime.month, currentDateTime.day),
        )) {
          return true;
        }

        // Kalau tanggal reservasi sama dengan hari ini
        if (reservationDateTime.year == currentDateTime.year &&
            reservationDateTime.month == currentDateTime.month &&
            reservationDateTime.day == currentDateTime.day) {
          // Tampilkan hanya kalau jamnya sudah lewat
          return reservationDateTime.isBefore(currentDateTime);
        }

        // Kalau tanggal reservasi di masa depan, jangan tampilkan
        return false;
      }).toList();

      upcomingReservations.value = reservations.where((reservation) {
        DateTime reservationDateTime = DateTime.parse(
          '${reservation.tanggal} ${reservation.waktu}',
        );

        // Kalau reservasi lebih baru dari sekarang (baik hari ini atau masa depan)
        return reservationDateTime.isAfter(currentDateTime);
      }).toList();

      // Sort past and upcoming reservations
      pastReservations.sort((reservationA, reservationB) {
        DateTime aDateTime = DateTime.parse(
          '${reservationA.tanggal} ${reservationA.waktu}',
        );
        DateTime bDateTime = DateTime.parse(
          '${reservationB.tanggal} ${reservationB.waktu}',
        );
        return aDateTime.compareTo(bDateTime);
      });

      upcomingReservations.sort((reservationA, reservationB) {
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

  List<ReservationModel> get filteredReservations {
    List<ReservationModel> result = pastReservations;

    if (selectedDate.value != null && selectedDate.value!.isNotEmpty) {
      final parts = selectedDate.value!.split('-');
      if (parts.length == 3) {
        final apiDateFormat = "${parts[2]}-${parts[1]}-${parts[0]}";

        result = result
            .where((reservation) => reservation.tanggal == apiDateFormat)
            .toList();
      }
    }
        if (searchQuery.value.isNotEmpty) {
      String query = searchQuery.value.toLowerCase();
      result = result.where((reservation) {
        return reservation.nama.toLowerCase().startsWith(query) || 
               reservation.telp.toLowerCase().startsWith(query);
      }).toList();
    }

    if (selectedSpotId.value != 0) {
      result = result
          .where(
            (reservasi) =>
                int.parse(reservasi.lapangan) == selectedSpotId.value,
          )
          .toList();
    }

    return result;
  }
  

  void changeSpotFilter(int spotId) {
    selectedSpotId.value = spotId;
    update();
  }
}


