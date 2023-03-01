import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mental_health_app/music/models/music.dart';

import '../../core/theme/colors.dart';
import '../screens/play_screen.dart';
import '../services/music_services.dart';

class BestListenedMusic extends StatelessWidget {
  final Music music;
  final String type;
  final List<Music> musicList;
  final int Index;
  const BestListenedMusic(
      {super.key,
      required this.music,
      required this.musicList,
      required this.Index,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: lightgreenColor,
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
                  "Relax Sounds",
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  width: 210,
                  child: Text(
                    "Some of the most productive thing  you can do is relax",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w200),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    print(musicList[0].title);
                    final MusicServices musicServices = MusicServices();
                    await musicServices.updatemeditationListen(
                        music.docId, music.listen, type);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PlayScreen(
                              musicList: musicList,
                              index: 0,
                              type: type,
                            )));
                  },
                  child: Container(
                    width: 135,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PLAY NOW',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'Poppoins',
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.play_circle)
                      ],
                    ),
                  ),
                )
              ],
            ),
            Image.asset(
              "assets/images/music.png",
              width: 80,
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
