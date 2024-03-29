import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';

import 'package:just_audio/just_audio.dart';
import 'package:mental_health_app/music/models/music.dart';
import 'package:mental_health_app/music/services/music_services.dart';
import 'package:mental_health_app/sleepBetter/services/sleep_services.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import '../../core/theme/colors.dart';
import '../widgets/seek_bar.dart';

class PlayScreen extends StatefulWidget {
  final List<Music> musicList;
  final int index;
  final String type;
  final String Sleeptype;

  const PlayScreen(
      {super.key,
      required this.musicList,
      required this.index,
      required this.type,
      this.Sleeptype = "CalmingSounds"});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  List<AudioSource> source = [];
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var song in widget.musicList) {
      source.add(
        AudioSource.uri(
          Uri.parse(song.url),
        ),
      );
    }
    audioPlayer.setAudioSource(ConcatenatingAudioSource(children: source),
        initialIndex: widget.index);
    _index = widget.index;
    setState(() {});
    Future.delayed(Duration(seconds: 1)).then((v) {
      showHeadphonesDialog(context);
    });
  }

  void showHeadphonesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        print("displayer headphones alert");
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Center(child: Text('Use Headphones')),
          surfaceTintColor: Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage("assets/images/earphones.gif"),
                width: 150,
                height: 150,
              ),
              Text(
                'For a better experience, please use headphones.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream,
          (Duration position, Duration? duration) {
        return SeekBarData(
          position,
          duration ?? Duration.zero,
        );
      });
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 15, top: 40),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Iconsax.arrow_left_2,
                  size: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          audioPlayer.playing
              ? Container(
                  width: 300,
                  height: 300,
                  child: RippleWave(
                    color: primaryColor,
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(widget.musicList[_index].image),
                      radius: 100,
                    ),
                  ),
                )
              : CircleAvatar(
                  backgroundImage: NetworkImage(widget.musicList[_index].image),
                  radius: 100,
                ),
          SizedBox(
            height: 50,
          ),
          Text(
            widget.musicList[_index].title,
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700),
          ),
          Text(
            "By Painting with Passion",
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'Poppins',
                color: Colors.grey,
                fontWeight: FontWeight.w200),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Text(""),
              Expanded(
                child: StreamBuilder<SeekBarData>(
                  stream: _seekBarDataStream,
                  builder: (context, snapshot) {
                    final positionData = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SeekBar(
                        position: positionData?.position ?? Duration.zero,
                        duration: positionData?.duration ?? Duration.zero,
                        onChangeEnd: audioPlayer.seek,
                      ),
                    );
                  },
                ),
              ),
              Text(""),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (audioPlayer.hasPrevious) {
                    _index = audioPlayer.nextIndex!;
                    setState(() {});
                    audioPlayer.seekToPrevious().then((value) async {
                      if (widget.type != "Music") {
                        if (widget.Sleeptype == 'CalmingSounds') {
                          await SleepServices().updatemeditationListen(
                              widget.musicList[_index].docId,
                              widget.musicList[_index].listen,
                              "CalmingSounds");
                        }
                        if (widget.Sleeptype == 'Quran') {
                          await SleepServices().updatemeditationListen(
                              widget.musicList[_index].docId,
                              widget.musicList[_index].listen,
                              "Quran");
                        }
                        setState(() {});
                      } else {
                        await MusicServices().updatemeditationListen(
                            widget.musicList[_index].docId,
                            widget.musicList[_index].listen,
                            widget.type);
                        setState(() {});
                      }
                    });
                  }
                },
                child: Icon(
                  Icons.skip_previous_outlined,
                  size: 50,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              audioPlayer.playing
                  ? GestureDetector(
                      onTap: () {
                        audioPlayer.pause();
                        setState(() {});
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: primaryColor),
                        child: Icon(
                          Icons.pause,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        audioPlayer.play();
                        setState(() {});
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: primaryColor),
                        child: Icon(
                          Icons.play_arrow,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (audioPlayer.hasNext) {
                    _index = audioPlayer.nextIndex!;
                    setState(() {});
                    audioPlayer.seekToNext().then((value) async {
                      if (widget.type != "Music") {
                        if (widget.Sleeptype == 'CalmingSounds') {
                          await SleepServices().updatemeditationListen(
                              widget.musicList[_index].docId,
                              widget.musicList[_index].listen,
                              "CalmingSounds");
                        }
                        if (widget.Sleeptype == 'Quran') {
                          await SleepServices().updatemeditationListen(
                              widget.musicList[_index].docId,
                              widget.musicList[_index].listen,
                              "Quran");
                        }
                      }
                      await MusicServices().updatemeditationListen(
                          widget.musicList[_index].docId,
                          widget.musicList[_index].listen,
                          widget.type);
                      setState(() {});
                    });
                  }
                },
                child: Icon(
                  Icons.skip_next_outlined,
                  size: 50,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
