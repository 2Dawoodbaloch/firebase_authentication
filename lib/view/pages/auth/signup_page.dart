import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/view/pages/auth/login_page.dart';
import 'package:flutter/material.dart';

import '../../../helper/constants/app_dimentions.dart';
import '../../../helper/constants/app_strings.dart';
import '../../widget/auth/choice_button.dart';
import '../../widget/auth/custom_field.dart';
import '../../widget/auth/label_text.dart';
import '../../widget/auth/primary_button.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  void signup(){
    auth.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()).then((value){

    }).onError((error,stackTrace){
      print("error!");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
       padding: AppDims.padding,
        children: [
          Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LabelText(text: AppStrings.signup,color: Colors.black,fontSize: 60,),
                  AppDims.space2,
                  CustomField(
                    controller: emailController,
                    isCircular: true,
                    hint: AppStrings.mail,
                    label: AppStrings.mail,
                    keyboardType: TextInputType.emailAddress,
                    prefix: Icon(Icons.mail_lock),
                    validator: (value){
                      if(value!.isEmpty) {
                        return "please enter email";
                      }
                      return null;
                    },
                  ),
                  AppDims.space2,
                  CustomField(controller: passwordController,
                    isCircular: true,
                    hint: AppStrings.password,
                    label: AppStrings.password,
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: true,
                    prefix: Icon(Icons.password),
                    validator: (value){
                      if(value!.isEmpty){
                        return "password required";
                      }
                      return null;
                    },
                  ),
                  AppDims.space2,
                  PrimaryButton(text: AppStrings.login,height: 50,onTap: (){
                    if (_formKey.currentState!.validate()) {
                      signup();
                    } else {
                      print("signup error");
                    }
                  },
                  ),
                  AppDims.space2,
                  ChoiceButton(desc: "Already have account", btnName: "Sign in",onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(BuildContext context) => const LoginPage(), ));
                  },)
                ],
              )),
        ],
      ),
    );
  }
}
