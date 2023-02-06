import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/consts/colors.dart';

import '../services/feed_services.dart';

class MoodLevel extends StatefulWidget {
  const MoodLevel({
    Key? key,
  }) : super(key: key);

  @override
  State<MoodLevel> createState() => _MoodLevelState();
}

class _MoodLevelState extends State<MoodLevel> {
  bool startAnimating = false;
  String Mood = "";
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        setState(() {
          startAnimating = true;
        });
      });
    });
    // TODO: implement initState
    super.initState();
    getMood();
  }

  getMood() async {
    Mood = await feedServices()
        .getUserMood(FirebaseAuth.instance.currentUser!.uid);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 300 + (0 * 100)),
            transform: Matrix4.translationValues(
                startAnimating ? 0 : MediaQuery.of(context).size.width, 0, 0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Mood == "Happy"
                          ? Border.all(width: 3, color: primaryColor)
                          : null),
                  child: Image.asset(
                    "assets/images/neutral.png",
                    width: 60,
                    height: 60,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Happy",
                  style: Mood == 'Happy'
                      ? TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: primaryColor)
                      : TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 300 + (1 * 100)),
            transform: Matrix4.translationValues(
                startAnimating ? 0 : MediaQuery.of(context).size.width, 0, 0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Mood == "Stress"
                          ? Border.all(width: 3, color: primaryColor)
                          : null),
                  child: Image.asset(
                    "assets/images/stressed.png",
                    width: 60,
                    height: 60,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Stress",
                  style: Mood == 'Stress'
                      ? TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: primaryColor)
                      : TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 300 + (2 * 100)),
            transform: Matrix4.translationValues(
                startAnimating ? 0 : MediaQuery.of(context).size.width, 0, 0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Mood == "Anxiety"
                          ? Border.all(width: 3, color: primaryColor)
                          : null),
                  child: Image.asset(
                    "assets/images/anxiety.png",
                    width: 60,
                    height: 60,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Anxiety",
                  style: Mood == 'Anxiety'
                      ? TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: primaryColor)
                      : TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 300 + (3 * 100)),
            transform: Matrix4.translationValues(
                startAnimating ? 0 : MediaQuery.of(context).size.width, 0, 0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Mood == "Depression"
                          ? Border.all(width: 3, color: primaryColor)
                          : null),
                  child: Image.asset(
                    "assets/images/depression.png",
                    width: 60,
                    height: 60,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Depression",
                  style: Mood == 'Depression'
                      ? TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                          color: primaryColor)
                      : TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
