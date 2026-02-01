import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/helper/constants/app_dimentions.dart';
import 'package:firebase_authentication/helper/constants/app_strings.dart';
import 'package:firebase_authentication/view/utils/utils.dart';
import 'package:firebase_authentication/view/widget/auth/custom_field.dart';
import 'package:firebase_authentication/view/widget/auth/label_text.dart';
import 'package:firebase_authentication/view/widget/auth/primary_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController postController = TextEditingController();
  bool loading = false;
  final firebaseDatabaseRef = FirebaseDatabase.instance.ref("posts");

  Future<void> savePost() async {
    if (postController.text.isEmpty) {
      Utils().toastMessage("post should not be empty");
      return;
    }

    try {
      String postId = DateTime.now().microsecondsSinceEpoch.toString();

      await firebaseDatabaseRef.child(postId).set({
        "title": postController.text,
        "id": postId,
      });

      Utils().toastMessage("Post added successfully!");
      postController.clear();
    } catch (error) {
      Utils().toastMessage(error.toString());
    } finally {
      if (mounted) {
        setState(() => loading = false);
      }
    }
  }

  void databaseRef() {
    firebaseDatabaseRef
        .child('2')
        .set({"title": postController.text.toString(), "age": 22})
        .then((value) {
          Utils().toastMessage("successfully added");
          setState(() {
            loading = false;
          });
        })
        .onError((error, stackTrace) {
          Utils().toastMessage(error.toString());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LabelText(text: AppStrings.post, fontSize: 30),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),

      body: Padding(
        padding: AppDims.padding,
        child: Column(
          children: [
            CustomField(
              controller: postController,
              hint: AppStrings.postDesc,
              maxLines: 4,
              isCircular: true,
              isPassword: false,
            ),
            AppDims.space4,
            PrimaryButton(
              text: AppStrings.add,
              loading: loading,
              height: 50,
              onTap: () {
                setState(() {
                  loading = true;
                });
                savePost();
              },
            ),
          ],
        ),
      ),
    );
  }
}
