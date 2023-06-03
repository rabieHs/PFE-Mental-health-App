import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mental_health_app/analyse/models/questions.dart';
import 'package:mental_health_app/analyse/screens/emotion_recognition_screen.dart';
import 'package:mental_health_app/analyse/screens/quiz_screen.dart';
import 'package:mental_health_app/auth/screens/forget_password.dart';
import 'package:mental_health_app/auth/screens/register.dart';
import 'package:mental_health_app/consts/clipper.dart';
import 'package:mental_health_app/screens/home.dart';

import 'package:mental_health_app/auth/services/auth_services.dart';
import 'package:mental_health_app/services/notification_services.dart';
import 'package:mental_health_app/auth/widgets/custom_text_field.dart';

import '../../consts/widgets/custom_button.dart';
import '../../core/theme/colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget _buildEmail() {
      return Container();
    }

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
                Controller: emailController,
                icon: Icons.email,
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
              height: 30,
            ),
            GestureDetector(
              onTap: signInUser,
              child: CustomButton(
                text: "LOGIN",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ForgetPassword())),
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "DON'T HAVE AN ACCOUNT? ",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text(
                      "CREATE ACCOUNT",
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

  void signInUser() async {
    String? res = await AuthServices()
        .loginUser(emailController.text, passwordController.text);
    if (res == "sucess") {
      await AuthServices().checkUser().then((isCheked) {
        if (isCheked) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => EmotionRecognitionScreen(),
            ),
          );
        }
      });
    } else {
      showSnackBar(res!, context, Colors.red);
    }
  }
}
