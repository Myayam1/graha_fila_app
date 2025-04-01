import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:grafil_app/pages/dashboard/dashboardreservasipage.dart';
import 'package:grafil_app/pages/login/loginpage.dart';
import 'package:grafil_app/pages/reservasi/addreservasipage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: AddReservationPage(),
    );
  }
}

