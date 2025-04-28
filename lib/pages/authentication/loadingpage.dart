import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grafil_app/controllers/loading_controller.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final loadingController = Get.put(LoadingController());

    return Obx(() {
      return Scaffold(
        backgroundColor: Mycolors.white,
        body: Center(
          child: loadingController.isLoading.value
              ? Lottie.asset(
                  'assets/loadinganimation.json',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                )
              : const SizedBox.shrink(),
        ),
      );
  }
  );
      }
      }
    
    
  

