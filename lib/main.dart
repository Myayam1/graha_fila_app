import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grafil_app/routes/app_route.dart';


void main() {
  runApp(const MyApp());
    print("hi");

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash, 
      getPages: AppRoutes.routes,  
  
    );
  }
}
