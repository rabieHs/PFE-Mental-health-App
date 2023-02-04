import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mental_health_app/consts/widgets/custom_button.dart';
import 'package:mental_health_app/consts/widgets/custom_input_text.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              CustomButton(text: 'POST')
            ],
          )),
    );
  }
}
