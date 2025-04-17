// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class VerificationController extends GetxController {
//   late List<TextEditingController> textControllers;
//   late List<FocusNode> focusNodes;

//   @override
//   void onInit() {
//     textControllers = List.generate(4, (_) => TextEditingController());
//     focusNodes = List.generate(4, (_) => FocusNode());
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     for (var c in textControllers) {
//       c.dispose();
//     }
//     for (var f in focusNodes) {
//       f.dispose();
//     }
//     super.onClose();
//   }
// }

