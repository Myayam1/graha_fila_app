import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifficationController extends GetxController {
  List<TextEditingController> textControllers = List.generate(4, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  String get code {
    return textControllers.map((e) => e.text).join();
  }
}
