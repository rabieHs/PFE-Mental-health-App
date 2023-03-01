import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mental_health_app/meditation/screens/meditation_screen.dart';

import '../../core/theme/colors.dart';

class MeditationCard extends StatefulWidget {
  const MeditationCard({super.key});

  @override
  State<MeditationCard> createState() => _MeditationCardState();
}

class _MeditationCardState extends State<MeditationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: greyColor,
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Meditation",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  width: 210,
                  child: Text(
                    "Join now and make your mind pure thanks to the meditation clips specially selected for you",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w200),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          MeditationScreen(meditationType: "Meditation"))),
                  child: Container(
                    width: 120,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                        child: Text(
                      'JOIN NOW',
                      style: TextStyle(
                          fontSize: 13,
                          color: greyColor,
                          fontFamily: 'Poppoins',
                          fontWeight: FontWeight.w800),
                    )),
                  ),
                )
              ],
            ),
            Image.asset(
              "assets/images/lotus.png",
              width: 80,
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
