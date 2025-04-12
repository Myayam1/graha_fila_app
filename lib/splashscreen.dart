import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grafil_app/controllers/splashscreen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Image.asset(
              "assets/images/grahafilalogo.png",
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}


