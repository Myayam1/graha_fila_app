import 'package:get/get.dart';
import 'package:grafil_app/controllers/detail_reservasi_controller.dart';

class ReservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReservationController>(() => ReservationController());
  }
}
