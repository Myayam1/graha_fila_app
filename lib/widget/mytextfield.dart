import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final Widget? iconlogo;
  final Color? iconColor;
  final double width;
  final double height;
  final double borderRadius;
  final TextStyle? textStyle;
  final Color? textColor;
  final EdgeInsetsGeometry? margin; 

  const MyTextField({
    super.key,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.iconlogo, 
    this.iconColor,
    required this.width,
    required this.height,
    required this.borderRadius,
    this.textStyle,
    this.textColor,
    this.margin, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin, 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller ?? TextEditingController(),
        obscureText: obscureText,
        style: textStyle ?? GoogleFonts.montserrat(color: textColor ?? Colors.black),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(color: (textColor ?? Colors.black).withOpacity(0.6)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          prefixIcon: iconlogo,
        ),
      ),
    );
  }
}
