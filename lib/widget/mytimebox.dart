import 'package:flutter/material.dart';
import 'package:grafil_app/widget/mytext.dart';

class MyTimeBox extends StatelessWidget {
  final String time;
  final String status; // "available", "booked", "selected"
  final Color primaryColor;
  final Color disabledColor;
  final VoidCallback? onTap;
  final double borderWidth;
  final double borderRadius;

  const MyTimeBox.withStatus({
    Key? key,
    required this.time,
    required this.status,
    required this.primaryColor,
    required this.disabledColor,
    this.onTap,
    this.borderWidth = 2.0,
    this.borderRadius = 30.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define colors based on status
    Color borderColor;
    Color textColor;
    Color backgroundColor;
    bool isEnabled;

    switch (status) {
      case "available":
        borderColor = primaryColor;
        textColor = primaryColor;
        backgroundColor = Colors.transparent;
        isEnabled = true;
        break;
      case "booked":
        borderColor = disabledColor;
        textColor = Colors.white;
        backgroundColor = disabledColor;
        isEnabled = false;
        break;
      case "selected":
        borderColor = primaryColor;
        textColor = Colors.white;
        backgroundColor = primaryColor;
        isEnabled = true;
        break;
      default:
        borderColor = primaryColor;
        textColor = primaryColor;
        backgroundColor = Colors.transparent;
        isEnabled = true;
    }

    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        child: Center(
          child: MyText(
            text: time,
            textcolor: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}