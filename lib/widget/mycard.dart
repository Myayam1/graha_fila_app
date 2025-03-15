import 'package:flutter/material.dart';

class Mycard extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? color;
  final bool? hasOutline;
  final Color? outlineColor;
  final double? outlineWidth;
  final Widget? child;
  final VoidCallback? onTap;

  const Mycard({
    Key? key,
    this.width,
    this.height,
    this.borderRadius,
    this.color,
    this.hasOutline,
    this.outlineColor,
    this.outlineWidth,
    this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Defaultnya off jika null
      child: Container(
        width: width ?? 100.0,
        height: height ?? 100.0,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
          border: (hasOutline ?? false)
              ? Border.all(color: outlineColor ?? Colors.black, width: outlineWidth ?? 1.5)
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
          child: child ?? SizedBox.shrink(),
        ),
      ),
    );
  }
}