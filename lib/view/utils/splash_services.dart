import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/view/pages/auth/login_page.dart';
import 'package:firebase_authentication/view/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashServices {

  void isLogin(BuildContext context){

    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      Timer(const Duration(seconds: 3), (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      });
    }
    else {

      Timer(const Duration(seconds: 3), (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
      });
    }

  }
}