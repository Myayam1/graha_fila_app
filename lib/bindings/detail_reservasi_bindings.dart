import 'package:get/get.dart';
import 'package:grafil_app/controllers/detail_reservasi_controller.dart';

class DetailReservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailReservationController>(() => DetailReservationController());
  }
}
