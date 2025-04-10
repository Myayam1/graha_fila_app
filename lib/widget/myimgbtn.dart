import 'package:flutter/material.dart';

class MyImageButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double? margin;
  final double? borderRadius;

  const MyImageButton({
    Key? key,
    required this.imagePath,
    required this.onTap,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.margin,
    this.borderRadius, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin ?? 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 10), 
        child: GestureDetector(
          onTap: onTap,
          child: Image.asset(
            imagePath,
            width: width,
            height: height,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
