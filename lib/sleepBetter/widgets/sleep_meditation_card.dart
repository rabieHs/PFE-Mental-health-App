import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../core/theme/colors.dart';

class SleepMeditationCard extends StatelessWidget {
  const SleepMeditationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: nightGreyColor,
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Sleep Meditation",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Container(
              width: 270,
              child: const Text(
                "Some of the most productive thing  you can do is relax.",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w200),
              ),
            ),
            Text(
              'START ',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontFamily: 'Poppoins',
                  fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
    );
  }
}
