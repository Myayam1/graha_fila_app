import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grafil_app/controllers/forgot_password_controller.dart';
import 'package:grafil_app/controllers/newpassword_controller.dart';
import 'package:grafil_app/controllers/verification_controller.dart';
import 'package:grafil_app/pages/authentication/forgotPassword/forgotservice.dart';
import 'package:grafil_app/routes/app_route.dart';
import 'package:grafil_app/widget/mybutton.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/mytext.dart';
import 'package:grafil_app/widget/mycircletextfield.dart';

class Verificationpage extends StatelessWidget {
  const Verificationpage({super.key});

  @override
  Widget build(BuildContext context) {
    final verificationController = Get.find<VerifficationController>();
    final forgotpasswordControl = Get.find<ForgotPasswordController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Center(
                child: MyText(
                  text: "Verifikasi",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  textcolor: Mycolors.black,
                ),
              ),
              const SizedBox(height: 80),
              const Align(
                alignment: Alignment.center,
                child: MyText(
                  text: "Masukan Kode Verifikasi",
                  fontSize: 16,
                  textcolor: Mycolors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 45),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: MyCircleTextField(
                      controller: verificationController.textControllers[index],
                      focusNode: verificationController.focusNodes[index],
                      nextFocusNode:
                          index < 3
                              ? verificationController.focusNodes[index + 1]
                              : null,
                      previousFocusNode:
                          index > 0
                              ? verificationController.focusNodes[index - 1]
                              : null,
                    ),
                  );
                }),
              ),

              const SizedBox(height: 90),

              MyButton(
                text: "Kirim",
                onPressed: () async {
                  final code = verificationController.code;
                  final email = Get.find<ForgotPasswordController>().emailController.text;

                  try {
                    
                    final response = await ForgotPasswordService.validateCode(
                      email: email,
                      code: code,
                    );

                    
                    final newPassController = Get.put(NewPasswordController());
                    newPassController.setEmailAndCode(email: email, code: code);
                    Get.toNamed(AppRoutes.newPassword);
                  } catch (e) {
                    
                    Get.snackbar("Kode OTP Salah", "$e");
                  }
                },

                buttonbackgroundColor: Mycolors.blue,
                textColor: Mycolors.white,
                width: double.infinity,
                height: 50,
                borderRadius: 25,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),

              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: "Jika tidak mendapatkan kode, ",
                    fontSize: 14,
                    textcolor: Mycolors.grey,
                  ),
                  MyText(
                    text: "Kirim ulang",
                    fontSize: 14,
                    textcolor: Colors.red,
                    fontWeight: FontWeight.w500,
                    onTap: () {
                      // logika kirim ulang di sini
                      forgotpasswordControl.sendResetCode();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
