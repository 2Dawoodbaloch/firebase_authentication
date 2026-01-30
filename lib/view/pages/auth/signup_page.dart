import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/view/pages/auth/login_page.dart';
import 'package:firebase_authentication/view/utils/utils.dart';
import 'package:firebase_authentication/view/widget/auth/customContainer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  void signup(){
    auth.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()).then((value){
setState(() {
  loading = false;
});
    }).onError((error,stackTrace){
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  LabelText(text: AppStrings.signup,color: Colors.black,fontSize: 40,),
                  AppDims.space2,
                  CustomField(controller: nameController,
                    isCircular: true,
                    hint: AppStrings.hintName,
                    label: AppStrings.name,
                    keyboardType: TextInputType.name,
                    isPassword: true,
                    prefix: Icon(Icons.person_2_outlined),
                    validator: (value){
                    if(value!.isEmpty){
                      return "enter name";
                    }
                    if(value.length < 6) {
                      return "name is too short";
                    }
                    return null;
                    },
                  ),
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
                      if(value.contains(" ")){
                        return "empty spaces is not allowed in email";
                      }
                      if(value.startsWith(".") || value.endsWith(".")){
                        return "email should not start or end with dot";
                      }
                      return null;
                    },
                  ),
                  AppDims.space2,
                  CustomField(controller: passwordController,
                    isCircular: true,
                    hint: AppStrings.password,
                    label: AppStrings.hintPassword,
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: true,
                    prefix: Icon(Icons.password),
                    validator: (value){
                      if(value!.isEmpty){
                        return "password required";
                      }
                      if(value.length < 6) {
                        return "password should be greator then 6";
                      }
                      return null;
                    },
                  ),
                  AppDims.space2,
                  CustomField(controller: confirmPasswordController,
                    isCircular: true,
                    hint: AppStrings.confirmPassword,
                    label: AppStrings.hintConfirmPassword,
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: true,
                    prefix: Icon(Icons.password_outlined),
                    validator: (value){
                      if(value!.isEmpty){
                        return "confirm password required";
                      }

                      if(passwordController.text.toString() != value){
                        return "password should be match";
                      }

                      return null;
                    },
                  ),
                  AppDims.space2,
                  PrimaryButton(text: AppStrings.signup,loading:loading,height: 50,onTap: (){
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });
                      signup();
                    } else {
                      print("signup error");
                    }
                  },
                  ),
                ],
              )
          ),
          AppDims.space4,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomContainer(
                height: 1.0,
                width: 100,
                color: Colors.black,
              ),
              Text("Access Quickily"),
              CustomContainer(
                height: 1.0,
                width: 100,
                color: Colors.black,
              ),
            ],
          ),
          AppDims.space,
          CustomContainer(
            height: 50,
            width: 100,
            color: Colors.black,
            radius: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.apple,color: Colors.white,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.facebook_outlined,color: Colors.white)),
                IconButton(onPressed: (){}, icon: Icon(Icons.access_alarm_outlined,color: Colors.white)),
              ],
            ),
          ),
          AppDims.space4,
          ChoiceButton(desc: "Already have account", btnName: "Sign in",onTap: (){
            Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => const LoginPage(), ));
          },)
        ],
      ),
    );
  }
}
