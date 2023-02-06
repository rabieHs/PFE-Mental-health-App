import 'dart:math';

import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

import 'package:just_audio/just_audio.dart';
import 'package:mental_health_app/consts/colors.dart';
import 'package:mental_health_app/meditation/services/meditation_services.dart';
import 'package:mental_health_app/music/models/music.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import 'package:siri_wave/siri_wave.dart';

import '../../music/widgets/seek_bar.dart';
import '../models/meditation_model.dart';

class MeditationPlayScreen extends StatefulWidget {
  final List<Meditation> meditationList;
  final int index;
  final Meditation meditation;
  const MeditationPlayScreen(
      {super.key,
      required this.meditationList,
      required this.index,
      required this.meditation});

  @override
  State<MeditationPlayScreen> createState() => _MeditationPlayScreenState();
}

class _MeditationPlayScreenState extends State<MeditationPlayScreen> {
  final MeditationServices meditationServices = MeditationServices();
  SiriWaveController waveController = SiriWaveController();
  AudioPlayer audioPlayer = AudioPlayer();
  List<AudioSource> source = [];
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var song in widget.meditationList) {
      source.add(
        AudioSource.uri(
          Uri.parse(song.url),
        ),
      );
      audioPlayer.play();
    }
    audioPlayer.setAudioSource(ConcatenatingAudioSource(children: source),
        initialIndex: widget.index);
    _index = widget.index;
    setState(() {});
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
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          StreamBuilder<PlayerState>(
              stream: audioPlayer.playerStateStream,
              builder: (context, snapshot) {
                if (snapshot.data!.playing == true) {
                  waveController.setAmplitude(1);
                  waveController.setSpeed(0.05);

                  waveController.setColor(Colors.red);
                  waveController.setFrequency(4);
                } else {
                  waveController.setAmplitude(0);
                  waveController.setSpeed(0.0);

                  waveController.setColor(Colors.red);
                  waveController.setFrequency(0);
                }
                return CircleAvatar(
                  backgroundColor: greyColor,
                  radius: 100,
                  child: SiriWave(
                    options:
                        SiriWaveOptions(backgroundColor: Colors.transparent),
                    controller: waveController,
                  ),
                );
              }),
          SizedBox(
            height: 50,
          ),
          Text(
            widget.meditationList[_index].title,
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700),
          ),
          Text(
            "By ${widget.meditationList[_index].owner}",
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
                    audioPlayer.seekToPrevious().then((value) async {
                      await meditationServices.updatemeditationListen(
                          widget
                              .meditationList[audioPlayer.previousIndex!].docId,
                          widget.meditationList[audioPlayer.previousIndex!]
                              .listen,
                          'Sleep');
                      setState(() {});
                    });
                    _index = audioPlayer.previousIndex!;

                    setState(() {});
                  }
                },
                child: Icon(
                  Icons.skip_previous_outlined,
                  color: Colors.black,
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
                    audioPlayer.seekToNext().then((value) async {
                      setState(() {});
                    });
                    _index = audioPlayer.nextIndex!;
                    meditationServices.updatemeditationListen(
                        widget.meditationList[audioPlayer.nextIndex!].docId,
                        widget.meditationList[audioPlayer.nextIndex!].listen,
                        'Sleep');
                    setState(() {});
                  }
                },
                child: Icon(
                  Icons.skip_next_outlined,
                  size: 50,
                  color: Colors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
