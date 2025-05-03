import 'package:get/get.dart';
import 'package:grafil_app/controllers/addreservation_controller.dart';
import 'package:grafil_app/pages/reservasi/API/addreservasi_service.dart';


class AddReservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddReservationService>(() => AddReservationService());
    Get.lazyPut<AddReservationController>(() => AddReservationController());
  }
}