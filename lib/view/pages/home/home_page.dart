import 'package:firebase_authentication/helper/constants/app_dimentions.dart';
import 'package:firebase_authentication/view/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              } ,
              icon: Icon(Icons.logout_outlined))
        ],
      ),
    );
  }
}
