import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mental_health_app/consts/colors.dart';
import 'package:mental_health_app/meditation/models/meditation_model.dart';
import 'package:mental_health_app/meditation/services/meditation_services.dart';

import '../widgets/meditation_play_card.dart';
import '../widgets/top_listened_card.dart';

class MeditationScreen extends StatefulWidget {
  final String meditationType;
  const MeditationScreen({super.key, required this.meditationType});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  List<Meditation> meditationList = List.empty();
  List<Color> colorList = [
    primaryColor,
    nightBlue1,
    greenColor,
    pinkColor,
    greyColor,
    orangeColor,
    secondaryColor,
    nightGreyColor,
    vaioletColor,
  ];
  MeditationServices meditationServices = MeditationServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMeditation();
    setState(() {});
  }

  getMeditation() async {
    if (widget.meditationType == 'Sleep') {
      meditationList = await meditationServices.getMeditationForSleep();
      setState(() {});
    } else {
      meditationList = await meditationServices.getMeditation();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Meditation"),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: meditationList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Top Listened",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TopListenedCard(
                          MeditationType: widget.meditationType,
                          index: 0,
                          meditation: meditationList[0],
                          meditationList: meditationList,
                          color: vaioletColor,
                        ),
                        TopListenedCard(
                          MeditationType: widget.meditationType,
                          index: 1,
                          meditation: meditationList[1],
                          meditationList: meditationList,
                          color: orangeColor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Discover",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      itemCount: meditationList.length - 2,
                      itemBuilder: (context, index) {
                        int _index = index + 2;
                        return MeditationPlayCard(
                            MeditationType: widget.meditationType,
                            color: colorList[index],
                            meditation: meditationList[_index],
                            meditationList: meditationList,
                            index: _index);
                      },
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
