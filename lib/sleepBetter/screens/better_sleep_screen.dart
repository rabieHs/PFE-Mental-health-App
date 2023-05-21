import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mental_health_app/meditation/screens/meditation_screen.dart';
import 'package:mental_health_app/music/models/music.dart';
import 'package:mental_health_app/sleepBetter/screens/sounds_screen.dart';
import 'package:mental_health_app/sleepBetter/screens/tips_for_sleeping.dart';
import 'package:mental_health_app/sleepBetter/services/sleep_services.dart';
import 'package:mental_health_app/sleepBetter/widgets/sleep_meditation_card.dart';

import '../../core/theme/colors.dart';
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
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back)),
          title: const Text("Better Sleep"),
          elevation: 0,
        ),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverAppBar(
                centerTitle: true,
                expandedHeight: 70,
                automaticallyImplyLeading: false,
                floating: true,
                snap: true,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.symmetric(horizontal: 5),
                  centerTitle: true,
                  title: Text(
                    "For Better Sleep.",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ))
          ],
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "For You",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MeditationScreen(
                                meditationType: 'Sleep',
                              ))),
                      child: const SleepMeditationCard()),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Discover",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                          child: const SleepGridCard(
                              color: greenColor, title: 'Calming Sounds')),
                      const SleepGridCard(
                        color: pinkColor,
                        title: 'Natural Sounds',
                      ),
                      GestureDetector(
                        onTap: () async {
                          List<Music> sounds =
                              await SleepServices().getCalmingSounds('Quran');
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SoundScreen(
                                    title:
                                        "Close Your Eyes And Listen tu Quran.",
                                    sleepType: "Quran",
                                    sounds: sounds,
                                  )));
                        },
                        child: const SleepGridCard(
                          color: orangeColor,
                          title: 'Quran',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const TipsForSleepingScreen()));
                        },
                        child: const SleepGridCard(
                          color: vaioletColor,
                          title: 'Tips For Sleeping',
                        ),
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
