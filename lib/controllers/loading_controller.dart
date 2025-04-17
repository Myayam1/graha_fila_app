import 'package:get/get.dart';

class LoadingController extends GetxController {
  var isLoading = true.obs; 
  
  void stopLoading() {
    isLoading.value = false; 
  }

  void startLoading() {
    isLoading.value = true; 
  }
}
