import 'package:flutter/material.dart';
class PrimaryButton extends StatelessWidget {
  final String? text;
  final double? width;
  final double height;
  final Color bgColor;
  final Color fgColor;
  final double fontSize;
  final Widget? child;
  final BoxDecoration? decoration;
  final double radius;
  final Function()? onTap;

  const PrimaryButton({
    super.key,
    this.width,
    this.height = 40,
    this.text,
    this.radius = 5.0,
    this.fontSize = 18.0,
    this.fgColor = Colors.white,
    this.child,
    this.decoration,
    this.onTap,
    this.bgColor = Colors.black

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: decoration ?? BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: child ?? Text(text ?? "",style: TextStyle(fontSize: fontSize,color: fgColor),textAlign: TextAlign.center),
      ),
    );
  }
}
