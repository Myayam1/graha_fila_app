import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final bool? hasOutline;
  final Color? outlineColor;
  final double? outlineWidth;
  final List<TextInputFormatter>? inputFormatters; 
  final TextInputType? keyboardType;
  final bool? digitsOnly;
  final Function(String)? onDateSelected;
  final ValueChanged<String>? onChanged;

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
    this.hasOutline,
    this.outlineColor,
    this.outlineWidth,
    this.inputFormatters,
    this.keyboardType,
    this.digitsOnly,
    this.onDateSelected,
    this.onChanged
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
        border:
            (widget.hasOutline ?? false)
                ? Border.all(
                  color: widget.outlineColor ?? Mycolors.grey,
                  width: widget.outlineWidth ?? 1.5,
                )
                : null,
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
          onChanged: widget.onChanged,
          keyboardType:
              widget.keyboardType ??
              (widget.digitsOnly == true
                  ? TextInputType.number
                  : TextInputType.text),
          inputFormatters:
              widget.digitsOnly == true
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : null,
          style:
              widget.textStyle ??
              GoogleFonts.montserrat(
                color: widget.textcolor ?? Colors.black,
                fontSize: 14,
                fontWeight: widget.fontWeight ?? FontWeight.normal,
              ),
          readOnly: widget.isDatePicker,
          onTap:
              widget.isDatePicker
                  ? () async {
                    DateTime now = DateTime.now();
                    DateTime initialDate = selectedDate ?? now;

                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: initialDate,
                      firstDate: DateTime.now(),
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
                      String formattedDate = DateFormat(
                        'dd-MM-yyyy',
                      ).format(pickedDate);
                      setState(() {
                        selectedDate = pickedDate;
                        widget.controller?.text = formattedDate;
                      });

                      if (widget.onDateSelected != null) {
                        widget.onDateSelected!(formattedDate);
                      }
                    }
                  }
                  : null,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle:
                widget.hintTextStyle ??
                GoogleFonts.montserrat(
                  color: widget.textcolor ?? Colors.black,
                  fontSize: 14,
                  fontWeight: widget.fontWeight ?? FontWeight.normal,
                ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 13,
            ),
            prefixIcon: widget.iconlogo,
            suffixIcon: widget.suffixIcon,
          ),
          textAlignVertical: TextAlignVertical.center,
        ),
      ),
    );
  }
}
