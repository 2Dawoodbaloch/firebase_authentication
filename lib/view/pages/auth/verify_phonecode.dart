import 'package:flutter/material.dart';
class VerifyPhonecode extends StatefulWidget {
  final String verificationId;
  const VerifyPhonecode({super.key,required this.verificationId});

  @override
  State<VerifyPhonecode> createState() => _VerifyPhonecodeState();
}

class _VerifyPhonecodeState extends State<VerifyPhonecode> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("verify phone"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
