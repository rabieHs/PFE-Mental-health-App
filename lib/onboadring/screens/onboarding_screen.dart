import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mental_health_app/analyse/screens/emotion_recognition_screen.dart';
import 'package:mental_health_app/auth/screens/login.dart';
import 'package:mental_health_app/consts/widgets/custom_button.dart';
import 'package:mental_health_app/core/theme/colors.dart';
import 'package:mental_health_app/core/theme/theme.dart';
import 'package:mental_health_app/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/onboarding_list.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  late PageController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  _storeOnboardingInfo() async {
    int isView = 1;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('OnBoard', isView);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(actions: [
          TextButton(
              onPressed: () async {
                await _storeOnboardingInfo();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text(
                "Skip",
                style: TextStyle(color: primaryColor),
              ))
        ]),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: PageView.builder(
              controller: controller,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: screens.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(screens[index].img),
                    Container(
                      height: 10.0,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: screens.length,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 3.0),
                                  width: currentIndex == index ? 25 : 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: currentIndex == index
                                          ? secondaryColor
                                          : primaryColor,
                                      borderRadius: BorderRadius.circular(8)),
                                )
                              ],
                            );
                          }),
                    ),
                    Text(
                      screens[index].text,
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      screens[index].desc,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: () async {
                        await _storeOnboardingInfo();
                        if (index == screens.length - 1) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => Login(),
                          ));
                        }
                        controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      },
                      child: OnboardingDynamicCustomButton(
                          text: "Next", width: 135, height: 40),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
