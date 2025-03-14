import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? buttonbackgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? icon;
  final bool isOutlined;
  final Color? outlineColor;
  final double? width;
  final double? height;

  const MyButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.buttonbackgroundColor,
    this.textColor,
    this.fontSize,
    this.fontWeight, 
    this.borderRadius,
    this.elevation,
    this.padding,
    this.margin,
    this.icon,
    this.isOutlined = false,
    this.outlineColor,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin ?? EdgeInsets.zero,
      child: isOutlined
          ? Ink(
              decoration: BoxDecoration(
                color: buttonbackgroundColor, 
                borderRadius: BorderRadius.circular(borderRadius ?? 12),
              ),
              child: OutlinedButton(
                onPressed: onPressed,
                style: OutlinedButton.styleFrom(
                  padding: padding ?? const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  side: BorderSide(color: outlineColor ?? Colors.grey, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 12),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      icon!,
                      const SizedBox(width: 8),
                    ],
                    Text(
                      text,
                      style: GoogleFonts.montserrat(
                        color: textColor ?? const Color.fromARGB(255, 255, 255, 255),
                        fontSize: fontSize ?? 16,
                        fontWeight: fontWeight ?? FontWeight.normal, 
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonbackgroundColor ?? const Color.fromARGB(255, 255, 255, 255),
                padding: padding ?? const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                elevation: elevation ?? 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 12),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(width: 8),
                  ],
                  Text(
                    text,
                    style: GoogleFonts.montserrat(
                      color: textColor ?? Colors.white,
                      fontSize: fontSize ?? 16,
                      fontWeight: fontWeight ?? FontWeight.w500, 
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
