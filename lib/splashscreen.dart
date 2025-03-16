import 'package:flutter/material.dart';
import 'package:grafil_app/widget/myimgbtn.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body: Center(
  child: 
    MyImageButton(imagePath: "assets/images/grahafilalogo.png", onTap: (){},margin: 16, width: MediaQuery.of(context).size.width * 0.6,height: MediaQuery.of(context).size.height * 0.3, fit: BoxFit.contain)
  
 ),

    );
  }
}