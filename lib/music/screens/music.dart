import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
            child: Column(
              children: [
                BestListenedMusic(),
                SizedBox(
                  height: 25,
                ),
                FutureBuilder<List<Music>>(
                    future: _musicServices.getMusic("Stress"),
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
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PlayScreen(
                                          musicList: snapshot.data!,
                                          index: index,
                                        )));
                              },
                              child: MusicCard(
                                backgroundImage: data[index].image,
                                title: data[index].title,
                              ),
                            );
                          });
                    })
              ],
            )),
      ),
    );
  }
}
