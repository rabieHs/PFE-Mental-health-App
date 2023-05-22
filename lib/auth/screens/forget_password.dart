import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iconsax/iconsax.dart';

import '../../consts/widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Iconsax.arrow_left_2),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/mindwell.png",
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Forget Password",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 70,
                ),
                CustomTextField(
                    Controller: emailController,
                    icon: Icons.email,
                    hint: 'enter your email',
                    isPassword: false),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {},
                  child: CustomButton(
                    text: "Send Code",
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
