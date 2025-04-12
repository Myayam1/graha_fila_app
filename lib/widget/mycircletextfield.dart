import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grafil_app/widget/mycolor.dart';

class MyCircleTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final FocusNode? previousFocusNode;

  const MyCircleTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
    this.previousFocusNode,
  });

  @override
  State<MyCircleTextField> createState() => _MyCircleTextFieldState();
}

class _MyCircleTextFieldState extends State<MyCircleTextField>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _animate() {
    setState(() {
      _scale = 1.2;
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _scale = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: widget.focusNode.hasFocus ? Mycolors.blue : Mycolors.grey.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: ClipOval(
        child: RawKeyboardListener(
          focusNode: FocusNode(),
          onKey: (event) {
            if (event is RawKeyDownEvent &&
                event.logicalKey == LogicalKeyboardKey.backspace &&
                widget.controller.text.isEmpty) {
              widget.previousFocusNode?.requestFocus();
            }
          },
          child: Center(
            child: AnimatedScale(
              scale: _scale,
              duration: const Duration(milliseconds: 100),
              child: TextField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 1,
                style: GoogleFonts.montserrat(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Mycolors.darkBlue,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  filled: false,
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  constraints: BoxConstraints(
                    maxWidth: 30,
                    maxHeight: 40,
                  ),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _animate();
                    widget.nextFocusNode?.requestFocus();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
