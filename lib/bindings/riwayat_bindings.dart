import 'package:get/get.dart';
import 'package:grafil_app/controllers/riwayat_reservasi_controller.dart';


class RiwayatReservasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatReservationController>(() => RiwayatReservationController());
  }
}