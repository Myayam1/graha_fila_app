import 'package:get/get.dart';
import 'package:grafil_app/bindings/forgotpass_binding.dart';
import 'package:grafil_app/bindings/login_binding.dart';
import 'package:grafil_app/bindings/newpassword_binding.dart';
import 'package:grafil_app/bindings/register_binding.dart';
import 'package:grafil_app/bindings/splashscreen_binding.dart';
import 'package:grafil_app/bindings/verification_binding.dart';
import 'package:grafil_app/pages/authentication/forgotPassword/forgotpasswordpage.dart';
import 'package:grafil_app/pages/authentication/newpassword/newpasswordpage.dart';
import 'package:grafil_app/pages/authentication/verification/verificationpage.dart';
import 'package:grafil_app/pages/dashboard/dashboardlapangan.dart';
import 'package:grafil_app/pages/dashboard/dashboardreservasipage.dart';
import 'package:grafil_app/pages/detail_lapangan/reservasilapangan1.dart';
import 'package:grafil_app/pages/detail_lapangan/reservasilapangan2.dart';
import 'package:grafil_app/pages/detail_lapangan/reservasilapangan3.dart';
import 'package:grafil_app/pages/authentication/login/loginpage.dart';
import 'package:grafil_app/pages/reservasi/addreservasipage.dart';
import 'package:grafil_app/pages/riwayat/riwayat_pendapatan/pagependapatanlap1.dart';
import 'package:grafil_app/pages/riwayat/riwayat_pendapatan/pagependapatanlap2.dart';
import 'package:grafil_app/pages/riwayat/riwayat_pendapatan/pagependapatanlap3.dart';
import 'package:grafil_app/pages/riwayat/riwayat_reservasi/pageriwayatreservasi.dart';
import 'package:grafil_app/pages/riwayat/riwayat_reservasi/riwayatlapangan1.dart';
import 'package:grafil_app/pages/riwayat/riwayat_reservasi/riwayatlapangan2.dart';
import 'package:grafil_app/pages/riwayat/riwayat_reservasi/riwayatlapangan3.dart';
import 'package:grafil_app/pages/authentication/register/registerpage.dart';
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
  static const riwayatreservasi1 = '/riwayat/lapangan1';
  static const riwayatreservasi2 = '/riwayat/lapangan2';
  static const riwayatreservasi3 = '/riwayat/lapangan3';
  static const pageRiwayat = '/riwayat/page';
  static const addReservasi = '/reservasi/add';
  static const pendapatanlap1 = '/riwayat/pendapatan1';
  static const pendapatanlap2 = '/riwayat/pendapatan2';
  static const pendapatanlap3 = '/riwayat/pendapatan3';
 

 

  static final routes = [
    GetPage(
      name: AppRoutes.splash, 
      page: () => SplashScreen(), 
      binding: SplashBinding()
      ),

    GetPage(
      name: AppRoutes.login, 
      page: () => LoginPage(),
      binding: LoginBinding()
      ),

    GetPage(
      name: AppRoutes.register, 
      page: () => RegisterPage(),
      binding: RegisterBinding()
      ),

    GetPage(
      name: AppRoutes.forgotPassword, 
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),

      ),

    GetPage(
      name: AppRoutes.newPassword, 
      page: () => Newpasswordpage(),
      binding: NewPasswordBinding()
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
      name: AppRoutes.riwayatreservasi1, 
      page: () => RiwayatReservasi1(),
      transition: Transition.noTransition,
      ),

    GetPage(
      name: AppRoutes.riwayatreservasi2, 
      page: () => RiwayatReservasi2(),
      transition: Transition.noTransition,
      ),

    GetPage(
      name: AppRoutes.riwayatreservasi3, 
      page: () => RiwayatReservasi3(),
      transition: Transition.noTransition,
      ),

    GetPage(
      name: AppRoutes.pageRiwayat, 
      page: () => RiwayatReservasi(),
      transition: Transition.noTransition,
      ),

    GetPage(
      name: AppRoutes.addReservasi, 
      page: () => AddReservationPage()
      ),

    GetPage(
      name: AppRoutes.pendapatanlap1, 
      page: () => RiwayatPendapatanLapangan1(),
      transition: Transition.noTransition,
      ),

    GetPage(
      name: AppRoutes.pendapatanlap2, 
      page: () => RiwayatPendapatanLapangan2(),
      transition: Transition.noTransition,
      ),

    GetPage(
      name: AppRoutes.pendapatanlap3, 
      page: () => RiwayatPendapatanLapangan3(),
      transition: Transition.noTransition,
      ),



  ];
}
