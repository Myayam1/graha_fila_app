import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grafil_app/routes/app_route.dart';
import 'package:grafil_app/widget/mycolor.dart';


void main() {
  runApp(const MyApp());
    print("hi");

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Mycolors.white,
        ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash, 
      getPages: AppRoutes.routes,  
  
    );
  }
}
