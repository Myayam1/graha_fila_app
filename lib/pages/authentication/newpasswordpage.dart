import 'package:flutter/material.dart';
import 'package:grafil_app/widget/mybutton.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/mytext.dart';
import 'package:grafil_app/widget/mytextfield.dart';

class Newpasswordpage extends StatelessWidget {
  const Newpasswordpage({super.key});

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
                  text: "Password Baru",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  textcolor: Mycolors.black,
                ),
              ),

              const SizedBox(height: 70),

              // New Password Label
              const Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Masukan Password Baru",
                  fontSize: 16,
                  textcolor: Mycolors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 14),

              // New Password TextField
              const MyTextField(
                width: double.infinity,
                height: 50,
                borderRadius: 25,
                hintText: "Minimal 8 digits",
                obscureText: true,
                hasOutline: true,
              ),

              const SizedBox(height: 40),

              // Confirm Password Label
              const Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Konfirmasi Password",
                  fontSize: 16,
                  textcolor: Mycolors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 14),

              // Confirm Password TextField - showing password dots
              const MyTextField(
                width: double.infinity,
                height: 50,
                borderRadius: 25,
                hintText: "",
                obscureText: true,
                hasOutline: true,
              ),

              const SizedBox(height: 60,),

              // Reset Password Button
              MyButton(
                text: "Kirim",
                onPressed: () {
                  
                },
                buttonbackgroundColor: Mycolors.blue,
                textColor: Mycolors.white,
                width: double.infinity,
                height: 50,
                borderRadius: 25,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),

              
            ],
          ),
        ),
      ),
    );
  }
}
