import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// class Utils {
//   void toastMessage({
//     String? msg,  // Make all optional with ?
//     double? fontSize,
//     Color? textColor,
//     Color? bgColor,
//     ToastGravity? gravity,  // Add ? here too!
//   }) {
//     Fluttertoast.showToast(
//       msg: msg ?? "Default message",
//       fontSize: fontSize ?? 16,
//       textColor: textColor ?? Colors.black,
//       backgroundColor: bgColor ?? Colors.red,
//       gravity: gravity ?? ToastGravity.BOTTOM,  // Default if null
//       toastLength: Toast.LENGTH_SHORT,
//       timeInSecForIosWeb: 1,
//     );
//   }
// }
class Utils {
  void toastMessage(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      fontSize: 16,
      textColor: Colors.black,
      backgroundColor: Colors.red,
      gravity: ToastGravity.BOTTOM,  // Default if null
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
    );
  }
}