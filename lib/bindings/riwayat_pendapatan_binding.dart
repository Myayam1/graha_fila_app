import 'package:get/get.dart';
import 'package:grafil_app/controllers/riwayat_pendapatan_controller.dart';

class RiwayatPendapatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatPendapatanController>(() => RiwayatPendapatanController());
  }
}