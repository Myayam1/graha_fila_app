import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:grafil_app/pages/login/loginpage.dart';
import 'package:grafil_app/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       home: LoginPage(),
    );
  }
}

