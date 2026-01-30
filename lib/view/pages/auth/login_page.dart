import 'package:firebase_authentication/helper/constants/app_dimentions.dart';
import 'package:firebase_authentication/helper/constants/app_strings.dart';
import 'package:firebase_authentication/view/pages/auth/loginwith_phone.dart';
import 'package:firebase_authentication/view/pages/auth/signup_page.dart';
import 'package:firebase_authentication/view/pages/home/home_page.dart';
import 'package:firebase_authentication/view/utils/utils.dart';
import 'package:firebase_authentication/view/widget/auth/choice_button.dart';
import 'package:firebase_authentication/view/widget/auth/custom_field.dart';
import 'package:firebase_authentication/view/widget/auth/label_text.dart';
import 'package:firebase_authentication/view/widget/auth/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    auth
        .signInWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString(),
        )
        .then((value) {
          Utils().toastMessage("Login successful!");
          setState(() {
            loading = false;
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        })
        .onError((error, stackTrace) {
          Utils().toastMessage(error.toString());
          debugPrint(error.toString());
          setState(() {
            loading = false;
          });
        });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        // appBar: AppBar(),
        body: ListView(
          padding: AppDims.padding,
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppDims.space6,
                  LabelText(
                    text: AppStrings.login,
                    color: Colors.black,
                    fontSize: 40,
                  ),
                  AppDims.space2,
                  CustomField(
                    controller: emailController,
                    isCircular: true,
                    hint: AppStrings.mail,
                    label: AppStrings.mail,
                    keyboardType: TextInputType.emailAddress,
                    prefix: Icon(Icons.mail_lock),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter email";
                      }
                      return null;
                    },
                  ),
                  AppDims.space2,
                  CustomField(
                    controller: passwordController,
                    isCircular: true,
                    hint: AppStrings.password,
                    label: AppStrings.password,
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: true,
                    prefix: Icon(Icons.password),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password required";
                      }
                      if (value.length < 6){
                      return "password length atleast greator then 6";
                      }
                      return null;
                    },
                  ),
                  AppDims.space2,
                  PrimaryButton(
                    text: AppStrings.login,
                    loading: loading,
                    height: 50,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        login();
                      } else {
                        Utils().toastMessage("Login error!");
                      }
                    },
                  ),
                  AppDims.space2,
                  ChoiceButton(
                    desc: "have you not registered yet",
                    btnName: "Sign up",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const SignupPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            AppDims.space2,
            PrimaryButton(
              text: "login with Phone",
              height: 50,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginwithPhone()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
