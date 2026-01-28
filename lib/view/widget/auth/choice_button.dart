import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class ChoiceButton extends StatelessWidget {
  final String desc;
  final Function()? onTap;
  final String btnName;
  const ChoiceButton({
    super.key,
    required this.desc,
    required this.btnName,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
     TextSpan(
       children: [
         TextSpan(text: desc),
         TextSpan(text: " "),
         TextSpan(
           recognizer: TapGestureRecognizer()..onTap = onTap,
           text: btnName,
           style: TextStyle(
             fontWeight: FontWeight.w700,
             decoration: TextDecoration.underline,
             color: Colors.blue,
           )
         )
       ]
     ),
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.center,
    );
  }
}
