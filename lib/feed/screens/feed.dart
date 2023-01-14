import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mental_health_app/feed/widgets/meditation_card.dart';
import 'package:mental_health_app/feed/widgets/sleep_card.dart';
import 'package:mental_health_app/quotes/widgets/quotes_card.dart';

import '../widgets/mood_lever.dart';
import '../widgets/task_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Icon(
            Iconsax.menu,
            color: Colors.black,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CircleAvatar(
                radius: 17,
              ),
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back, ",
                      style: TextStyle(fontSize: 27),
                    ),
                    Text(
                      "Rabie!",
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "How are you feeling today ?",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      MoodLevel()
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Today's Task",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 30,
                ),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: TaskCard(),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: QuotesCard()),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: MeditationCard()),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: SleepCard()),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
