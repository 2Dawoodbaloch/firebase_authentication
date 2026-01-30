import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/helper/constants/app_dimentions.dart';
import 'package:firebase_authentication/view/pages/auth/login_page.dart';
import 'package:firebase_authentication/view/utils/utils.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final auth = FirebaseAuth.instance;
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(10),
        backgroundColor: Colors.blue,
        title: Text("Home Page"),
        actions: [
          IconButton(
              onPressed:(){
                auth.signOut().then((value){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                }).onError((error,stackTrace){
                  Utils().toastMessage(error.toString());
                });
              } ,
              icon: Icon(Icons.logout_outlined))
        ],
      ),
    );
  }
}
