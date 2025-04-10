import 'package:flutter/material.dart';
import 'package:grafil_app/widget/mybutton.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/mytext.dart';
import 'package:grafil_app/widget/mytextfield.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.blue,
      body: Column(
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
                    hintText: "Username",
                    iconlogo: const Icon(Icons.person),
                    width: double.infinity,
                    height: 50,
                    borderRadius: 24,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
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
                    hintText: "No Telp",
                    iconlogo: const Icon(Icons.phone),
                    width: double.infinity,
                    height: 50,
                    borderRadius: 24,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    hintText: "Email",
                    iconlogo: const Icon(Icons.email),
                    width: double.infinity,
                    height: 50,
                    borderRadius: 24,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const MyText(
                        text: "Sudah punya akun?",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(width: 4),
                      MyText(
                        text: "Masuk sekarang",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        textcolor: Mycolors.blue,
                        onTap: () {
                          
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  MyButton(
                    text: "Sign up",
                    onPressed: () {},
                    borderRadius: 24,
                    width: double.infinity,
                    height: 50,
                    buttonbackgroundColor: Mycolors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
