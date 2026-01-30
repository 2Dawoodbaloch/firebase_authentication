import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final Widget? child;
  final double radius;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? alignment;

  const CustomContainer({
    super.key,
    this.height,
    this.padding,
    this.margin,
    this.alignment,
    this.width = double.infinity,
    this.color = Colors.black,
    this.decoration,
    this.radius = 8.0,
    this.child

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      alignment: Alignment.center,
      decoration: decoration ?? BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius)
      ) ,
      child: child,
    );
  }
}
