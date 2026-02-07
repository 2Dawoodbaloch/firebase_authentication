import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/view/firestore_database/add_firestore_data.dart';
import 'package:firebase_authentication/view/pages/auth/login_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../helper/constants/app_dimentions.dart';
import '../utils/utils.dart';
class FirestoreDatabase extends StatefulWidget {
  const FirestoreDatabase({super.key});

  @override
  State<FirestoreDatabase> createState() => _FirestoreDatabaseState();
}

class _FirestoreDatabaseState extends State<FirestoreDatabase> {
  final databaseRef = FirebaseDatabase.instance.ref("posts");
  final auth = FirebaseAuth.instance;
  TextEditingController editController = TextEditingController();

  Future<void> showMyDiologue(String title,String id)async{
    editController.text = title;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Update"),
            content: Container(
              child: TextField(
                controller: editController,
                decoration: InputDecoration(
                    hintText: "edit",
                    border: UnderlineInputBorder()

                ),
              ),
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("cancel",style: TextStyle(color: Colors.black)),),
              TextButton(onPressed: (){
                Navigator.pop(context);
                databaseRef.child(id).update({
                  "title" : editController.text.toString(),
                  "id" : id.toString()
                }).then((value){
                  Utils().toastMessage("updated!");
                }).onError((error, stackTrace){
                  Utils().toastMessage(error.toString());
                });
              }, child: Text("update",style: TextStyle(color: Colors.black)))
            ],
          );
        }

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("FireStore",style: TextStyle(color:Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
auth.signOut().then((value){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
});
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddFirestoreData()),
          );
        },
      ),
      body: Padding(
        padding: AppDims.padding,
        child: Column(
          children: [
            // fetch data using animated list
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text("Dawood"),
                    );
                  })
            ),
          ],
        ),
      ),
    );;
  }
}
