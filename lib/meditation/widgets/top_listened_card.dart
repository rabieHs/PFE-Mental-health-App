import 'package:flutter/material.dart';
import 'package:mental_health_app/meditation/screens/meditation_play_screen.dart';
import 'package:mental_health_app/meditation/services/meditation_services.dart';

import '../models/meditation_model.dart';

class TopListenedCard extends StatelessWidget {
  final Color color;
  final Meditation meditation;
  final int index;
  final List<Meditation> meditationList;
  const TopListenedCard({
    Key? key,
    required this.color,
    required this.meditation,
    required this.meditationList,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MeditationServices meditationServices = MeditationServices();
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 3, right: 10, left: 10),
      width: MediaQuery.of(context).size.width * 0.43,
      height: MediaQuery.of(context).size.height * 0.26,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            'assets/images/meditation_card.png',
            height: 70,
            width: 70,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          meditation.title,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              meditation.duration,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  color: Colors.white),
            ),
            GestureDetector(
              onTap: () async {
                await meditationServices.updatemeditationListen(
                    meditation.docId, meditation.listen, 'Sleep');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MeditationPlayScreen(
                        meditationList: [meditationList[0], meditationList[1]],
                        index: index,
                        meditation: meditation)));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.17,
                height: MediaQuery.of(context).size.height * 0.035,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text("Start"),
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
