import 'dart:math';

import 'package:audio_progress_bars/audio_progress_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:mental_health_app/consts/colors.dart';

class PlayScreen extends StatefulWidget {
  final String image;
  const PlayScreen({super.key, required this.image});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final PlayerController playerController = PlayerController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    intializeaudio();
  }

  intializeaudio() async {
    final waveformData = await playerController.extractWaveformData(
      path: 'assets/images/audio.mp3',
      noOfSamples: 100,
    );
// Or directly extract from preparePlayer and initialise audio player
    await playerController.preparePlayer(
      path: 'assets/images/audio.mp3',
      shouldExtractWaveform: true,
      noOfSamples: 100,
      volume: 1.0,
    );
  }

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    List<double> randomList =
        List.generate(70, (index) => random.nextDouble() * (60 - 10) + 10);
    MediaQueryData queryData = MediaQuery.of(context);
    var rng = Random();

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
          CircleAvatar(
            backgroundImage: AssetImage(widget.image),
            radius: 100,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Painting Forest",
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
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      trackHeight: 4,
                      thumbShape: const RoundSliderThumbShape(
                          disabledThumbRadius: 6, enabledThumbRadius: 7),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 10),
                      activeTrackColor: primaryColor,
                      inactiveTrackColor: greyColor,
                      thumbColor: primaryColor,
                      overlayColor: primaryColor),
                  child: Slider(
                    min: 0.0,
                    max: 100.0,
                    value: min(50, 100),
                    onChanged: (value) {
                      setState(() {
                        ;
                      });
                    },
                    onChangeEnd: (value) {},
                  ),
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
              Icon(
                Icons.skip_previous_outlined,
                color: Colors.black,
                size: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Container(
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
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.skip_next_outlined,
                size: 50,
                color: Colors.black,
              )
            ],
          )
        ],
      ),
    );
  }
}
