import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mental_health_app/consts/colors.dart';

class SleepCard extends StatelessWidget {
  const SleepCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: nightBlue1,
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
                  "Sleep Better",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  width: 210,
                  child: const Text(
                    "Let's open up to the things that matter the most ",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w200),
                  ),
                ),
                Container(
                  width: 120,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7)),
                  child: const Center(
                      child: Text(
                    'START NOW',
                    style: TextStyle(
                        fontSize: 13,
                        color: nightBlue1,
                        fontFamily: 'Poppoins',
                        fontWeight: FontWeight.w800),
                  )),
                )
              ],
            ),
            Image.asset(
              "assets/images/moon.png",
              width: 80,
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
