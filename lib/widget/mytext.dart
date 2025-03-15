import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? textcolor;
  final FontWeight? fontWeight;
  final VoidCallback? onTap;

  const MyText({
    super.key,
    required this.text,
    this.fontSize,
    this.textcolor,
    this.fontWeight,
    this.onTap, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: Text(
        text,
        style: AppTextStyle.getBaseStyle(
          fontSize: fontSize,
          color: textcolor,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
class AppTextStyle {
  static TextStyle getBaseStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) {
    return GoogleFonts.nunito(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      letterSpacing: 0.5,
    );
  }
}
