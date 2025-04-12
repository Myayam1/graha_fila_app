import 'package:get/get.dart';
import 'package:grafil_app/bindings/splashscreen_binding.dart';
import 'package:grafil_app/bindings/verification_binding.dart';
import 'package:grafil_app/pages/authentication/forgotpasswordpage.dart';
import 'package:grafil_app/pages/authentication/newpasswordpage.dart';
import 'package:grafil_app/pages/authentication/verificationpage.dart';
import 'package:grafil_app/pages/dashboard/dashboardlapangan.dart';
import 'package:grafil_app/pages/dashboard/dashboardreservasipage.dart';
import 'package:grafil_app/pages/detail_lapangan/reservasilapangan1.dart';
import 'package:grafil_app/pages/detail_lapangan/reservasilapangan2.dart';
import 'package:grafil_app/pages/detail_lapangan/reservasilapangan3.dart';
import 'package:grafil_app/pages/authentication/loginpage.dart';
import 'package:grafil_app/pages/reservasi/addreservasipage.dart';
import 'package:grafil_app/pages/riwayat/pageriwayatreservasi.dart';
import 'package:grafil_app/pages/riwayat/riwayatlapangan1.dart';
import 'package:grafil_app/pages/riwayat/riwayatlapangan2.dart';
import 'package:grafil_app/pages/riwayat/riwayatlapangan3.dart';
import 'package:grafil_app/pages/authentication/registerpage.dart';
import 'package:grafil_app/splashscreen.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forgot/password';
  static const newPassword = '/new/password';
  static const verification = '/verification';
  static const dashboardLapangan = '/dashboard/lapangan';
  static const dashboardReservasi = '/dashboard/reservasi';
  static const reservasi1 = '/reservasi/lapangan1';
  static const reservasi2 = '/reservasi/lapangan2';
  static const reservasi3 = '/reservasi/lapangan3';
  static const riwayat1 = '/riwayat/lapangan1';
  static const riwayat2 = '/riwayat/lapangan2';
  static const riwayat3 = '/riwayat/lapangan3';
  static const pageRiwayat = '/riwayat/page';
  static const addReservasi = '/reservasi/add';

  static final routes = [
    GetPage(
      name: AppRoutes.splash, 
      page: () => SplashScreen(), 
      binding: SplashBinding()
      ),

    GetPage(
      name: AppRoutes.login, 
      page: () => LoginPage()
      ),

    GetPage(
      name: AppRoutes.register, 
      page: () => RegisterPage()
      ),

    GetPage(
      name: AppRoutes.forgotPassword, 
      page: () => ForgotPasswordPage()
      ),

    GetPage(
      name: AppRoutes.newPassword, 
      page: () => Newpasswordpage()
      ),
      
    GetPage(
      name: AppRoutes.verification, 
      page: () => Verificationpage(),
      binding: VerificationBinding()
      ),

    GetPage(
      name: AppRoutes.dashboardLapangan, 
      page: () => DashboardLapanganPage()
      ),

    GetPage(
      name: AppRoutes.dashboardReservasi, 
      page: () => DashboardReservasiPage()
      ),

    GetPage(
      name: AppRoutes.reservasi1, 
      page: () => Reservasilapangan1()
      ),

    GetPage(
      name: AppRoutes.reservasi2, 
      page: () => ReservasiLapangan2()
      ),

    GetPage(
      name: AppRoutes.reservasi3, 
      page: () => ReservasiLapangan3()
      ),

    GetPage(
      name: AppRoutes.riwayat1, 
      page: () => RiwayatReservasi1()
      ),

    GetPage(
      name: AppRoutes.riwayat2, 
      page: () => RiwayatReservasi2()
      ),

    GetPage(
      name: AppRoutes.riwayat3, 
      page: () => RiwayatReservasi3()
      ),

    GetPage(
      name: AppRoutes.pageRiwayat, 
      page: () => RiwayatReservasi()
      ),

    GetPage(
      name: AppRoutes.addReservasi, 
      page: () => AddReservationPage()
      ),
  ];
}
