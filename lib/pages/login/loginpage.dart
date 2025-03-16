import 'package:flutter/material.dart';
import 'package:grafil_app/widget/mybutton.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:grafil_app/widget/mytext.dart';
import 'package:grafil_app/widget/mytextfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor:Mycolors.blue,
      body: Column(
        children: [
          const SizedBox(height: 65),
          const MyText(
            text: "Hello!",
            fontSize: 45,
            fontWeight: FontWeight.w800,
            textcolor: Mycolors.white,
          ),
          const SizedBox(height: 12),
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
                    hintText: "Username",
                    iconlogo: const Icon(Icons.person),
                    width: double.infinity,
                    height: 50,
                    borderRadius: 24,
                    textStyle:TextStyle( fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    hintText: "Password",
                    obscureText: true,
                    iconlogo: const Icon(Icons.lock),
                    width: double.infinity,
                    height: 50,
                    borderRadius: 24,
                    textStyle:TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MyText(
                      text: "Lupa password?",
                      textcolor: Mycolors.blue,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: 10),
                  
                  MyButton(
                    text: "Masuk",
                    onPressed: () {},
                    borderRadius: 24,
                    width: double.infinity,
                    height: 50,
                    buttonbackgroundColor: Mycolors.blue,
                  ),
                  
                 
              
                const SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Mycolors.grey, 
                          thickness: 1, 
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: MyText(
                          text: "Atau",
                          textcolor: Mycolors.grey, 
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Mycolors.grey,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  
                  MyButton(text: "Login dengan google", onPressed: () {},borderRadius: 24,width: double.infinity,height: 50,isOutlined: true,outlineColor: Mycolors.grey,icon:Image.asset("assets/images/googlelogo.png",height: 27,),textColor: Colors.black,fontSize: 16,fontWeight: FontWeight.w500,),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}