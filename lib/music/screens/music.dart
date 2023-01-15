import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mental_health_app/music/screens/play_screen.dart';
import 'package:mental_health_app/music/widgets/music_card.dart';
import 'package:mental_health_app/music/widgets/top_listened_music_widget.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                BestListenedMusic(),
                SizedBox(
                  height: 25,
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PlayScreen(
                                    image: "assets/images/bg4.jpg",
                                  )));
                        },
                        child:
                            MusicCard(backgroundImage: "assets/images/bg5.jpg"),
                      );
                    })
              ],
            )),
      ),
    );
  }
}
