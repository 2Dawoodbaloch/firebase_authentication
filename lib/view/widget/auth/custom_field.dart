import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool isCircular;
  final String? hint;
  final String? label;
  final bool filled;
  final double radius;
  final bool isPassword;
  final Widget? suffix;
  final Widget? prefix;

  const CustomField({
    super.key,
    required this.controller,
    this.isCircular = false,
    this.validator,
    this.hint,
    this.keyboardType,
    this.label,
    this.filled = false,
    this.radius = 5,
    this.isPassword = false,
    this.prefix,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        suffixIcon: suffix,
        prefixIcon: prefix,
        hintText: hint,
        labelText: label,
        border: isCircular
            ? OutlineInputBorder(borderRadius: BorderRadius.circular(radius),borderSide: BorderSide(color: Colors.black))
            : UnderlineInputBorder(),
        enabledBorder: isCircular
            ? OutlineInputBorder(borderRadius: BorderRadius.circular(radius),borderSide: BorderSide(color: Colors.black))
            : UnderlineInputBorder(),
        disabledBorder: isCircular
            ? OutlineInputBorder(borderRadius: BorderRadius.circular(radius),borderSide: BorderSide(color: Colors.black))
            : UnderlineInputBorder(),
        focusedBorder: isCircular
            ? OutlineInputBorder(borderRadius: BorderRadius.circular(radius),borderSide: BorderSide(color: Colors.blue))
            : UnderlineInputBorder(),
        errorBorder: isCircular
            ? OutlineInputBorder(borderRadius: BorderRadius.circular(radius),borderSide: BorderSide(color: Colors.red))
            : UnderlineInputBorder(),
        filled: filled,
      ),
    );
  }
}