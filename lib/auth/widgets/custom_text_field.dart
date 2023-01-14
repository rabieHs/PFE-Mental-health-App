import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mental_health_app/consts/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController Controller;
  final IconData icon;
  final String hint;
  final bool isPassword;
  CustomTextField(
      {super.key,
      required this.Controller,
      required this.icon,
      required this.hint,
      required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "field Empty !";
        }
      },
      controller: Controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2),
            borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.only(top: 14),
        prefixIcon: Icon(icon),
        hintText: hint,
      ),
      obscureText: isPassword,
    );
  }
}
