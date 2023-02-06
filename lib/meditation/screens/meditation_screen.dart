import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mental_health_app/consts/colors.dart';

import '../widgets/meditation_play_card.dart';
import '../widgets/top_listened_card.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Meditation"),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Top Listened",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TopListenedCard(
                    color: vaioletColor,
                  ),
                  TopListenedCard(
                    color: orangeColor,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Discover",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  MeditationPlayCard(color: primaryColor),
                  MeditationPlayCard(color: primaryColor),
                  MeditationPlayCard(color: primaryColor),
                  MeditationPlayCard(color: primaryColor),
                  MeditationPlayCard(color: primaryColor),
                  MeditationPlayCard(color: primaryColor),
                  MeditationPlayCard(color: primaryColor),
                  MeditationPlayCard(color: primaryColor),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
