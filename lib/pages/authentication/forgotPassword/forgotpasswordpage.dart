import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grafil_app/controllers/forgot_password_controller.dart';
import 'package:grafil_app/routes/app_route.dart';
import 'package:grafil_app/widget/mybutton.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/mytext.dart';
import 'package:grafil_app/widget/mytextfield.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final forgotpasswordControl = Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Title
              const Center(
                child: MyText(
                  text: "Lupa password",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  textcolor: Mycolors.black,
                ),
              ),

              const SizedBox(height: 110),

              // Email Field Label
              const Align(
                alignment: Alignment.center,
                child: MyText(
                  text: "Masukan Alamat Email",
                  fontSize: 16,
                  textcolor: Mycolors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 45),

              // Email TextField
              MyTextField(
                width: double.infinity,
                height: 50,
                borderRadius: 25,
                hasOutline: true,
                controller: forgotpasswordControl.emailController,
              ),

              const SizedBox(height: 110),

              MyButton(
                text: "Kirim",
                onPressed: () {
                  forgotpasswordControl.sendResetCode();
                },

                buttonbackgroundColor: Mycolors.blue,
                textColor: Mycolors.white,
                width: double.infinity,
                height: 50,
                borderRadius: 25,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),

              const SizedBox(height: 30),

              MyText(
                text: "Kembali ke login",
                fontSize: 14,
                textcolor: Mycolors.grey,
                onTap: () {
                  Get.toNamed(AppRoutes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
