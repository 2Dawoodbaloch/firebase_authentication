import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/helper/constants/app_dimentions.dart';
import 'package:firebase_authentication/helper/constants/app_strings.dart';
import 'package:firebase_authentication/view/pages/auth/verify_phonecode.dart';
import 'package:firebase_authentication/view/utils/utils.dart';
import 'package:firebase_authentication/view/widget/auth/custom_field.dart';
import 'package:firebase_authentication/view/widget/auth/primary_button.dart';
import 'package:flutter/material.dart';
class LoginwithPhone extends StatefulWidget {
  const LoginwithPhone({super.key});

  @override
  State<LoginwithPhone> createState() => _LoginwithPhoneState();
}

class _LoginwithPhoneState extends State<LoginwithPhone> {
  final auth = FirebaseAuth.instance;
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login with phone"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Form(child: Column(
          children: [
            CustomField(
              keyboardType: TextInputType.phone,
                controller: phoneController,
              hint: "+123 453 678",
              label: "phone",
              prefix:Icon(Icons.phone_android_outlined),
              isCircular: true,
              isPassword: false,
            ),
            AppDims.space4,
            PrimaryButton(
              text: AppStrings.login,
              height: 60,
              onTap: (){
                auth.verifyPhoneNumber(
                  phoneNumber: phoneController.text,
                    verificationCompleted: (_){},
                    verificationFailed: (e){
                    Utils().toastMessage(e.toString());
                    },
                    codeSent: (String verificationId, int? token){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyPhonecode(verificationId: verificationId,)));
                    },
                    codeAutoRetrievalTimeout: (e){
                    Utils().toString();
                    });
              },
            )
          ],
        )),
      )
    );
  }
}
