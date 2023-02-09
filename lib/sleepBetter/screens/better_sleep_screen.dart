import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mental_health_app/consts/colors.dart';
import 'package:mental_health_app/meditation/screens/meditation_screen.dart';
import 'package:mental_health_app/music/models/music.dart';
import 'package:mental_health_app/sleepBetter/screens/sounds_screen.dart';
import 'package:mental_health_app/sleepBetter/services/sleep_services.dart';
import 'package:mental_health_app/sleepBetter/widgets/sleep_meditation_card.dart';

import '../widgets/sleep_greed_card.dart';

class BetterSleepScreen extends StatefulWidget {
  const BetterSleepScreen({super.key});

  @override
  State<BetterSleepScreen> createState() => _BetterSleepScreenState();
}

class _BetterSleepScreenState extends State<BetterSleepScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Better Sleep"),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
                centerTitle: true,
                expandedHeight: 70,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                floating: true,
                snap: true,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.symmetric(horizontal: 5),
                  centerTitle: true,
                  title: Text(
                    "For Better Sleep.",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                ))
          ],
          body: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "For You",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MeditationScreen(
                                meditationType: 'Sleep',
                              ))),
                      child: SleepMeditationCard()),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Discover",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GridView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    children: [
                      GestureDetector(
                          onTap: () async {
                            List<Music> sounds = await SleepServices()
                                .getCalmingSounds('CalmingSounds');
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SoundScreen(
                                      title: "Close Your Eyes And Dream.",
                                      sleepType: "CalmingSounds",
                                      sounds: sounds,
                                    )));
                          },
                          child: SleepGridCard(
                              color: greenColor, title: 'Calming Sounds')),
                      SleepGridCard(
                        color: pinkColor,
                        title: 'Natural Sounds',
                      ),
                      SleepGridCard(
                        color: orangeColor,
                        title: 'Quran',
                      ),
                      SleepGridCard(
                        color: vaioletColor,
                        title: 'Tips For Sleeping',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
