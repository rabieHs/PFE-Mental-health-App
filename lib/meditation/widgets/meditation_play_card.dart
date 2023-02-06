import 'package:flutter/material.dart';
import 'package:mental_health_app/meditation/models/meditation_model.dart';
import 'package:mental_health_app/meditation/screens/meditation_play_screen.dart';
import 'package:mental_health_app/meditation/services/meditation_services.dart';

class MeditationPlayCard extends StatelessWidget {
  final Meditation meditation;
  final List<Meditation> meditationList;
  final Color color;
  final int index;
  const MeditationPlayCard({
    Key? key,
    required this.color,
    required this.meditation,
    required this.meditationList,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MeditationServices meditationServices = MeditationServices();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: EdgeInsets.all(13),
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meditation.title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Text(
                  meditation.duration,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
            GestureDetector(
              onTap: () async {
                await meditationServices.updatemeditationListen(
                    meditation.docId, meditation.listen, 'Sleep');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MeditationPlayScreen(
                        meditationList: meditationList,
                        index: index,
                        meditation: meditation)));
              },
              child: Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 45,
              ),
            )
          ],
        ),
      ),
    );
  }
}
