import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/helper/constants/app_dimentions.dart';
import 'package:firebase_authentication/view/pages/auth/login_page.dart';
import 'package:firebase_authentication/view/pages/post/post.dart';
import 'package:firebase_authentication/view/utils/utils.dart';
import 'package:firebase_authentication/view/widget/auth/custom_field.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final databaseRef = FirebaseDatabase.instance.ref("posts");
  TextEditingController searchFilterController = TextEditingController();
  final auth = FirebaseAuth.instance;

  Future<void> signOut()async{
    try{
      await auth.signOut();
      Utils().toastMessage("signout successfully");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
    } catch(error){
     Utils().toastMessage(error.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Post",style: TextStyle(color:Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
             signOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostScreen()),
          );
        },
      ),
      body: Padding(
        padding: AppDims.padding,
        child: Column(
          children: [
            CustomField(
              keyboardType: TextInputType.text,
                controller: searchFilterController,
              hint: "search",
              isCircular: true,
              onChanged: (value){
                setState(() {

                });
                return;
              },
            ),

            // fetch data using stream builder
            // Expanded(
            //     child: StreamBuilder(
            //         stream: databaseRef.onValue,
            //         builder: (context,AsyncSnapshot<DatabaseEvent> snapshot){
            //           if (!snapshot.hasData){
            //             return CircularProgressIndicator();
            //           }
            //           else {
            //             Map<dynamic,dynamic> map = snapshot.data!.snapshot.value as dynamic;
            //             List<dynamic> list =  [];
            //             list.clear();
            //             list = map.values.toList();
            //             return ListView.builder(
            //               itemCount: snapshot.data!.snapshot.children.length,
            //               itemBuilder: (context,index){
            //                 return ListTile(
            //                   title: Text(list[index]["title"]),
            //                   subtitle: Text(list[index]["id"]),
            //                 );
            //               },
            //             );
            //           }
            //     })
            // ),

            // fetch data using animated list
            Expanded(
              child: FirebaseAnimatedList(
                query: databaseRef,
                defaultChild: Text("loading..."),
                itemBuilder: (context, snapshot, index, animation) {
                  final title = Text(snapshot.child("title").value.toString());

                  if(searchFilterController.text.isEmpty){
                    return ListTile(
                        subtitle: Text(snapshot.child('id').value.toString()),
                        title: Text(snapshot.child("title").value.toString()));
                  }

                  else if(title.data!.toLowerCase().contains(searchFilterController.text.toLowerCase())){
                    return ListTile(
                        subtitle: Text(snapshot.child('id').value.toString()),
                        title: Text(snapshot.child("title").value.toString()));
                  }

                  else {
                    return Container();
                    }

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
