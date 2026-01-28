import 'package:firebase_authentication/helper/constants/app_dimentions.dart';
import 'package:firebase_authentication/helper/constants/app_strings.dart';
import 'package:firebase_authentication/view/pages/auth/signup_page.dart';
import 'package:firebase_authentication/view/widget/auth/choice_button.dart';
import 'package:firebase_authentication/view/widget/auth/custom_field.dart';
import 'package:firebase_authentication/view/widget/auth/label_text.dart';
import 'package:firebase_authentication/view/widget/auth/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
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
                LabelText(text: AppStrings.login,color: Colors.black,fontSize: 60,),
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
                    print("successfully login");
                    //SnackBar(content: Text("login accepted"),backgroundColor: Colors.orange,);
                   auth.createUserWithEmailAndPassword(email: emailController.text.toString(), password: passwordController.text.toString());
                  } else {
                    print("login error");
                  }
                },
                ),
                AppDims.space2,
                ChoiceButton(desc: "have you registered yet", btnName: "Sign up",onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(BuildContext context) => const SignupPage(), ));
                },)
              ],
            )),

          ],
        ),
      ),
    );
  }
}
