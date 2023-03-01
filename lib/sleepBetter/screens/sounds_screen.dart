import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mental_health_app/music/models/music.dart';
import 'package:mental_health_app/music/widgets/music_card.dart';
import 'package:mental_health_app/sleepBetter/services/sleep_services.dart';

import '../../music/screens/play_screen.dart';

class SoundScreen extends StatefulWidget {
  final String title;
  final String sleepType;
  final List<Music> sounds;
  const SoundScreen(
      {super.key,
      required this.sounds,
      required this.title,
      required this.sleepType});

  @override
  State<SoundScreen> createState() => _SoundScreenState();
}

class _SoundScreenState extends State<SoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Calming Sounds",
        ),
      ),
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: ((context, innerBoxIsScrolled) => [
                SliverAppBar(
                  expandedHeight: 150,
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(widget.title),
                    ),
                    centerTitle: true,
                  ),
                  floating: true,
                  snap: true,
                  elevation: 0,
                )
              ]),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sounds",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.sounds.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () async {
                                final SleepServices sleepServices =
                                    SleepServices();
                                await sleepServices.updatemeditationListen(
                                    widget.sounds[index].docId,
                                    widget.sounds[index].listen,
                                    widget.sleepType);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PlayScreen(
                                          Sleeptype: widget.sleepType,
                                          type: 'Sleep',
                                          musicList: widget.sounds,
                                          index: index,
                                        )));
                              },
                              child: MusicCard(music: widget.sounds[index]));
                        })
                  ]),
            ),
          )),
    );
  }
}
