import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum IconPosition { left, right }

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? buttonbackgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? icon;
  final IconPosition iconPosition;
  final bool isOutlined;
  final Color? outlineColor;
  final double? width;
  final double? height;
  final bool isLoading;

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
    this.iconPosition = IconPosition.left,
    this.isOutlined = false,
    this.outlineColor,
    this.width,
    this.height,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildButtonContent() {
      if (isLoading) {
        return const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      }

      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null && iconPosition == IconPosition.left) ...[
            icon!,
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: GoogleFonts.montserrat(
              color: isOutlined
                  ? textColor ?? const Color.fromARGB(255, 255, 255, 255)
                  : textColor ?? Colors.white,
              fontSize: fontSize ?? 16,
              fontWeight: fontWeight ??
                  (isOutlined ? FontWeight.normal : FontWeight.w500),
            ),
          ),
          if (icon != null && iconPosition == IconPosition.right) ...[
            const SizedBox(width: 8),
            icon!,
          ],
        ],
      );
    }

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
                onPressed: isLoading ? null : onPressed,
                style: OutlinedButton.styleFrom(
                  padding: padding ??
                      const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 20,
                      ),
                  side: BorderSide(
                    color: outlineColor ?? Colors.grey,
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 12),
                  ),
                ),
                child: buildButtonContent(),
              ),
            )
          : ElevatedButton(
              onPressed: isLoading ? null : onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonbackgroundColor ??
                    const Color.fromARGB(255, 255, 255, 255),
                padding: padding ??
                    const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 20),
                elevation: elevation ?? 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 12),
                ),
              ),
              child: buildButtonContent(),
            ),
    );
  }
}
