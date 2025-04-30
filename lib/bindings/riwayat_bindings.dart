import 'package:get/get.dart';
import 'package:grafil_app/controllers/riwayat_controller.dart';


class RiwayatReservasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatReservationController>(() => RiwayatReservationController());
  }
}