import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grafil_app/widget/mycolor.dart';

class MyTimeBox extends StatelessWidget {
  final String time;
  final String status; 
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final VoidCallback? onTap;
  final bool isDisabled;

  const MyTimeBox({
    Key? key,
    required this.time,
    this.status = "available",
    this.backgroundColor = Colors.white,
    this.textColor = Colors.blue,
    this.borderColor = Colors.blue,
    this.borderWidth = 1.0,
    this.borderRadius = 25.0,
    this.onTap,
    this.isDisabled = false,
  }) : super(key: key);

  
  factory MyTimeBox.withStatus({
    required String time,
    required String status,
    required Color primaryColor,
    required Color disabledColor,
    VoidCallback? onTap,
    double borderWidth = 1.0,
    double borderRadius = 25.0,
  }) {
    switch (status) {
      case "available":
        return MyTimeBox(
          time: time,
          status: status,
          backgroundColor: Mycolors.background,
          textColor: Mycolors.darkBlue,
          borderColor: Mycolors.darkBlue,
          borderWidth: borderWidth,
          borderRadius: borderRadius,
          onTap: onTap,
        );
      case "selected":
        return MyTimeBox(
          time: time,
          status: status,
          backgroundColor: primaryColor.withOpacity(0.6),
          textColor: Colors.white,
          borderColor: primaryColor.withOpacity(0.6),
          borderWidth: borderWidth,
          borderRadius: borderRadius,
          onTap: onTap,
        );
      case "booked":
        return MyTimeBox(
          time: time,
          status: status,
          backgroundColor: disabledColor.withOpacity(0.1),
          textColor: disabledColor,
          borderColor: disabledColor.withOpacity(0.3),
          borderWidth: borderWidth,
          borderRadius: borderRadius,
          isDisabled: true,
          onTap: null,
        );
      default:
        return MyTimeBox(
          time: time,
          status: "available",
          backgroundColor: Mycolors.background,
          textColor: primaryColor,
          borderColor: primaryColor.withOpacity(0.5),
          borderWidth: borderWidth,
          borderRadius: borderRadius,
          onTap: onTap,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
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
          child: Text(
            time,
            style: GoogleFonts.montserrat(
              color: textColor,
              fontWeight: status == "selected" 
                  ? FontWeight.w600 
                  : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}