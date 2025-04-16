import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grafil_app/controllers/loading_controller.dart';
import 'package:grafil_app/widget/mycolor.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final loadingController = Get.put(LoadingController());

    return Obx(() {
      return Scaffold(
        backgroundColor: Mycolors.blue,
        body: Center(
          child: loadingController.isLoading.value
              ? const CircularProgressIndicator(color: Mycolors.white) 
              : const SizedBox.shrink(),  
        ),
      );
    });
  }
}
