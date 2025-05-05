import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grafil_app/routes/app_route.dart';
import 'package:grafil_app/widget/mybutton.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/mytext.dart';
import 'package:grafil_app/widget/mytextfield.dart';
import 'package:grafil_app/controllers/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final registerController = Get.find<RegisterController>();
    return Scaffold(
      backgroundColor: Mycolors.blue,
      body: SingleChildScrollView(
        child:Container(
           height: MediaQuery.of(context).size.height,
        
        child:Column( 
        children: [
          const SizedBox(height: 65),
          const MyText(
            text: "Register",
            fontSize: 40,
            fontWeight: FontWeight.w800,
            textcolor: Mycolors.white,
          ),
          const SizedBox(height: 70),
          Expanded(
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
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: registerController.usernameController,
                    hintText: "Username",
                    iconlogo: const Icon(Icons.person),
                    width: double.infinity,
                    height: 50,
                    borderRadius: 24,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: registerController.passwordController,
                    hintText: "Password",
                    obscureText: true,
                    iconlogo: const Icon(Icons.lock),
                    width: double.infinity,
                    height: 50,
                    borderRadius: 24,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: registerController.phoneController,
                    hintText: "No Telp",
                    iconlogo: const Icon(Icons.phone),
                    width: double.infinity,
                    height: 50,
                    borderRadius: 24,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    digitsOnly: true,
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: registerController.emailController,
                    hintText: "Email",
                    iconlogo: const Icon(Icons.email),
                    width: double.infinity,
                    height: 50,
                    borderRadius: 24,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sudah punya akun? ",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.login);
                        },
                        child: Text(
                          "Masuk sekarang",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Obx(() {
                    return MyButton(
                      text:
                          registerController.isLoading.value
                              ? "Memproses..."
                              : "Sign Up",
                      isLoading: registerController.isLoading.value,
                      onPressed:
                          registerController.isLoading.value
                          
                              ? null
                              : registerController.register,
                      borderRadius: 24,
                      width: double.infinity,
                      height: 50,
                      buttonbackgroundColor: Mycolors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      
                    );
                  }),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    )
    )
    );
  }
}
