import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mental_health_app/analyse/screens/emotion_recognition_screen.dart';
import 'package:mental_health_app/auth/screens/login.dart';
import 'package:mental_health_app/consts/clipper.dart';
import 'package:mental_health_app/screens/home.dart';

import 'package:mental_health_app/auth/services/auth_services.dart';
import 'package:mental_health_app/services/notification_services.dart';

import '../../consts/colors.dart';
import '../widgets/custom_text_field.dart';
import '../../consts/widgets/custom_button.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              height: 25,
            ),
            Text(
              "Login",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 25,
            ),
            CustomTextField(
                Controller: nameController,
                icon: Icons.email,
                hint: 'enter your name',
                isPassword: false),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
                Controller: emailController,
                icon: Icons.password,
                hint: 'enter your email',
                isPassword: false),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
                Controller: passwordController,
                icon: Icons.password,
                hint: 'enter your password',
                isPassword: true),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
                Controller: confirmPasswordController,
                icon: Icons.password,
                hint: 'confirm your password',
                isPassword: true),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: signUpUser,
              child: CustomButton(
                text: "REGISTER",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "HAVE AN ACCOUNT? ",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: primaryColor),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  void signUpUser() async {
    String? res = await AuthServices().cretaUser(
        nameController.text, emailController.text, passwordController.text);
    if (res == "sucess") {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => EmotionRecognitionScreen()));
    } else {
      showSnackBar(
        res!,
        context,
        Colors.red,
      );
    }
  }
}

class signUpButton extends StatelessWidget {
  const signUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 158,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            Color(0xfff7b858),
            Color(0xfffca148),
          ],
        ),
      ),
      child: Row(
        children: const [
          SizedBox(
            width: 20,
          ),
          Text(
            "SIGN UP",
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 17, color: Colors.white),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
