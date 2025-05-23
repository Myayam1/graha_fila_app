import 'package:get/get.dart';
import 'package:grafil_app/bindings/addreservation_binding.dart';
import 'package:grafil_app/bindings/detail_reservasi_bindings.dart';
import 'package:grafil_app/bindings/forgotpass_binding.dart';
import 'package:grafil_app/bindings/login_binding.dart';
import 'package:grafil_app/bindings/newpassword_binding.dart';
import 'package:grafil_app/bindings/register_binding.dart';
import 'package:grafil_app/bindings/riwayat_bindings.dart';
import 'package:grafil_app/bindings/riwayat_pendapatan_binding.dart';
import 'package:grafil_app/bindings/splashscreen_binding.dart';
import 'package:grafil_app/bindings/verification_binding.dart';
import 'package:grafil_app/pages/authentication/forgotPassword/forgotpasswordpage.dart';
import 'package:grafil_app/pages/authentication/newpassword/newpasswordpage.dart';
import 'package:grafil_app/pages/authentication/verification/verificationpage.dart';
import 'package:grafil_app/pages/authentication/loadingpage.dart';
import 'package:grafil_app/pages/dashboard/dashboardreservasipage.dart';
import 'package:grafil_app/pages/authentication/login/loginpage.dart';
import 'package:grafil_app/pages/reservasi/addreservasipage.dart';
import 'package:grafil_app/pages/riwayat/riwayat_pendapatan/pagependapatan.dart';
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
  static const dashboardReservasi = '/dashboard/reservasi';
  static const reservasi1 = '/reservasi/lapangan1';
  static const reservasi2 = '/reservasi/lapangan2';
  static const reservasi3 = '/reservasi/lapangan3';
  static const riwayatreservasi1 = '/riwayat/lapangan1';
  static const riwayatreservasi2 = '/riwayat/lapangan2';
  static const riwayatreservasi3 = '/riwayat/lapangan3';
  static const pageRiwayat = '/riwayat/page';
  static const addReservasi = '/reservasi/add';
  static const pendapatanlap = '/riwayat/pendapatan1';
  static const loading = '/loading';



 

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
      name: AppRoutes.dashboardReservasi, 
      page: () => DashboardReservasiPage(),
      binding: DetailReservationBinding(),
      transition: Transition.noTransition,
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
      page: () => RiwayatReservasiPage(),
      transition: Transition.noTransition,
      binding: RiwayatReservasiBinding()
      ),

    GetPage(
      name: AppRoutes.addReservasi, 
      page: () => AddReservationPage(),
      binding: AddReservationBinding()
      ),

    GetPage(
      name: AppRoutes.pendapatanlap, 
      page: () => RiwayatPendapatanLapangan(),
      binding: RiwayatPendapatanBinding(),
      transition: Transition.noTransition,
      ),

    GetPage(
      name: AppRoutes.loading, 
      page: () => LoadingPage()
      ),


  ];
}
