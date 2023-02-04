import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../colors.dart';

class CustomInputText extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hint;
  final int minLines;

  const CustomInputText(
      {super.key,
      required this.textEditingController,
      required this.hint,
      required this.minLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: 10,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "field Empty !";
        }
      },
      controller: textEditingController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2),
            borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.only(top: 14, left: 10),
        hintText: hint,
      ),
    );
  }
}
