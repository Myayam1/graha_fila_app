import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grafil_app/widget/mycolor.dart';
import 'package:intl/intl.dart';


class MyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final Widget? iconlogo;
  final Widget? suffixIcon;
  final Color? iconColor;
  final double width;
  final double height;
  final double borderRadius;
  final Color? textcolor;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final EdgeInsetsGeometry? margin;
  final bool isDatePicker;

  const MyTextField({
    super.key,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.iconlogo,
    this.suffixIcon,
    this.iconColor,
    this.textcolor,
    this.fontWeight,
    required this.width,
    required this.height,
    required this.borderRadius,
    this.textStyle,
    this.hintTextStyle,
    this.margin,
    this.isDatePicker = false,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          controller: widget.controller ?? TextEditingController(),
          obscureText: widget.obscureText,
          style: widget.textStyle ?? GoogleFonts.montserrat(
                color: widget.textcolor ?? Colors.black,
                fontSize: 14,
                fontWeight: widget.fontWeight ?? FontWeight.normal
          ),
          readOnly: widget.isDatePicker,
          onTap: widget.isDatePicker
              ? () async {
                  DateTime now = DateTime.now();
                  DateTime initialDate = selectedDate ?? now;

                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: initialDate,
                    firstDate: now,
                    lastDate: DateTime(2100),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData(
                          colorScheme: ColorScheme.light(
                            primary: Mycolors.blue, 
                            onPrimary: Mycolors.background, 
                            onSurface: Mycolors.darkBlue, 
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: Mycolors.darkBlue, 
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (pickedDate != null) {
                    setState(() {
                      selectedDate = pickedDate;
                      widget.controller?.text = DateFormat('dd-MM-yyyy').format(pickedDate);
                    });
                  }
                }
              : null,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: widget.hintTextStyle ??
                GoogleFonts.montserrat(
                  color: widget.textcolor ?? Colors.black,
                  fontSize: 14,
                  fontWeight: widget.fontWeight ?? FontWeight.normal
                  
                ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            prefixIcon: widget.iconlogo,
            suffixIcon: widget.suffixIcon,
          ),
          textAlignVertical: TextAlignVertical.center,
        ),
      ),
    );
  }
}