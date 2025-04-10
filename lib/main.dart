import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:grafil_app/pages/dashboard/dashboardlapangan.dart';
import 'package:grafil_app/pages/dashboard/dashboardreservasipage.dart';
import 'package:grafil_app/pages/dashboard/dataisemptydbreservasi.dart';
import 'package:grafil_app/pages/riwayat/pageriwayatreservasi.dart';
import 'package:grafil_app/register/registerpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: DashboardReservasiEmptyPage(),
    );
  }
}

