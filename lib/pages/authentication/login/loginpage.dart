import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grafil_app/controllers/login_controller.dart';
import 'package:grafil_app/routes/app_route.dart';
import 'package:grafil_app/widget/mybutton.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/mytext.dart';
import 'package:grafil_app/widget/mytextfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = Get.find<LoginController>();

  @override
  void initState() {
    super.initState();
    loginController.autoFillLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.blue,
      body: Column(
        children: [
          const SizedBox(height: 65),
          const MyText(
            text: "Hello!",
            fontSize: 55,
            fontWeight: FontWeight.w800,
            textcolor: Mycolors.white,
          ),
          const SizedBox(height: 2),
          const MyText(
            text: "Selamat datang di Graha Fila Sport",
            fontSize: 20,
            textcolor: Mycolors.white,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 120),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Mycolors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyText(
                    text: "Login",
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    hintText: "Email",
                    iconlogo: const Icon(Icons.email),
                    width: double.infinity,
                    height: 50,
                    borderRadius: 24,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    controller: loginController.emailController,
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    hintText: "Password",
                    obscureText: true,
                    iconlogo: const Icon(Icons.lock),
                    width: double.infinity,
                    height: 50,
                    borderRadius: 24,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    controller: loginController.passwordController,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MyText(
                      text: "Lupa password?",
                      textcolor: Mycolors.blue,
                      onTap: () {
                        Get.toNamed(AppRoutes.forgotPassword);
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  MyButton(
                    text: "Masuk",
                    onPressed: () {
                      loginController.login();
                    },
                    borderRadius: 24,
                    width: double.infinity,
                    height: 50,
                    buttonbackgroundColor: Mycolors.blue,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Belum punya akun? ",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offNamed(AppRoutes.register);
                        },
                        child: const Text(
                          "Daftar sekarang",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
