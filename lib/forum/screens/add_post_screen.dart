import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mental_health_app/auth/model/user.dart';
import 'package:mental_health_app/auth/provider/user_provider.dart';
import 'package:mental_health_app/consts/widgets/custom_button.dart';
import 'package:mental_health_app/consts/widgets/custom_input_text.dart';
import 'package:mental_health_app/forum/models/post_model.dart';
import 'package:mental_health_app/forum/services/post_services.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});
  void addPost(
    BuildContext context,
    String username,
    String profilePic,
    Timestamp date,
    String title,
    String uid,
    String content,
  ) async {
    final postId = Uuid().v1();
    Post post = Post(
        postId: postId,
        uid: uid,
        username: username,
        profilePic: profilePic,
        date: date,
        title: title,
        content: content,
        Likes: []);
    PostServices postServices = PostServices();
    await postServices.addPost(post, context, postId);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    final TextEditingController titleController = TextEditingController();
    final TextEditingController contentController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
          minimum: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Try share Your Story",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Title",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              CustomInputText(
                  textEditingController: titleController,
                  hint: "Write your story Title Here",
                  minLines: 1),
              SizedBox(
                height: 15,
              ),
              Text(
                "Content",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              CustomInputText(
                  textEditingController: contentController,
                  hint: "Tape Anything here ...",
                  minLines: 5),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                  onTap: () => addPost(
                      context,
                      user.username,
                      user.profileImage,
                      Timestamp.fromDate(DateTime.now().toUtc()),
                      titleController.text,
                      user.uid,
                      contentController.text),
                  child: CustomButton(text: 'POST'))
            ],
          )),
    );
  }
}
