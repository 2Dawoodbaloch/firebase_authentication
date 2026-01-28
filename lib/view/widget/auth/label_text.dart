import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const LabelText({
    super.key,
    required this.text,
    this.fontSize = 22,
    this.color = Colors.white,
    this.fontWeight = FontWeight.w800,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
