import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mental_health_app/auth/services/auth_services.dart';
import 'package:mental_health_app/feed/widgets/shimmer_widget.dart';
import 'package:mental_health_app/music/models/music.dart';
import 'package:mental_health_app/music/screens/play_screen.dart';
import 'package:mental_health_app/music/services/music_services.dart';
import 'package:mental_health_app/music/widgets/music_card.dart';
import 'package:mental_health_app/music/widgets/top_listened_music_widget.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

final MusicServices _musicServices = MusicServices();

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: FutureBuilder<List<Music>>(
                future: _musicServices.getMusic(),
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text("no Music"),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerWidget(height: 50, widht: 50),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  ShimmerWidget(height: 15, widht: 200),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ShimmerWidget(height: 15, widht: 200),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerWidget(height: 50, widht: 50),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  ShimmerWidget(height: 15, widht: 200),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ShimmerWidget(height: 15, widht: 200),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerWidget(height: 50, widht: 50),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  ShimmerWidget(height: 15, widht: 200),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ShimmerWidget(height: 15, widht: 200),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerWidget(height: 50, widht: 50),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  ShimmerWidget(height: 15, widht: 200),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ShimmerWidget(height: 15, widht: 200),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerWidget(height: 50, widht: 50),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                children: [
                                  ShimmerWidget(height: 15, widht: 200),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ShimmerWidget(height: 15, widht: 200),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }
                  return Column(
                    children: [
                      BestListenedMusic(
                        type: 'Music',
                        music: snapshot.data!.first,
                        Index: 0,
                        musicList: snapshot.data!,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length - 1,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () async {
                                final MusicServices musicServices =
                                    MusicServices();
                                await musicServices.updatemeditationListen(
                                    snapshot.data![index + 1].docId,
                                    snapshot.data![index + 1].listen,
                                    "Music");
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PlayScreen(
                                          type: "Music",
                                          musicList: snapshot.data!,
                                          index: index + 1,
                                        )));
                              },
                              child: MusicCard(
                                music: snapshot.data![index + 1],
                              ),
                            );
                          }),
                    ],
                  );
                })),
      ),
    );
  }
}
