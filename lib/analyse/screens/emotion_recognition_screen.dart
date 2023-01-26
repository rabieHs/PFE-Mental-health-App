import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/analyse/screens/text_classification.dart';
import 'package:mental_health_app/analyse/services/emotion_recognition_services.dart';

class EmotionRecognitionScreen extends StatefulWidget {
  const EmotionRecognitionScreen({super.key});

  @override
  State<EmotionRecognitionScreen> createState() =>
      _EmotionRecognitionScreenState();
}

class _EmotionRecognitionScreenState extends State<EmotionRecognitionScreen> {
  EmotionRecognitionServices emotionRecognitionServices =
      EmotionRecognitionServices();
  CameraController? controller;
  String emotion = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    availableCameras().then((cameras) {
      controller = CameraController(cameras[1], ResolutionPreset.medium);
      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
        getPredection();
      });
    });
  }

  getPredection() async {
    await emotionRecognitionServices
        .startVideoCapture(controller!)
        .then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => TextClassificationScreen(emotion: value)));
      setState(() {
        emotion = value;
      });
    });

    print(emotion);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text(
              "face emotion detection",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "please stay stable and stope move your head",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
                child: Image.asset(
              'assets/images/face_scan.gif',
              width: 250,
              height: 250,
            )),
            Text(
              emotion,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
