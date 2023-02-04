import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;

class EmotionRecognitionServices {
  Future<String> startViseoCapture(CameraController controller) async {
    String Emotion = "";
    controller.startVideoRecording().then((_) {
      Future.delayed(Duration(seconds: 2), () async {
        controller.stopVideoRecording().then((file) async {
          print('Stop Recording');
          final bytes = File(file.path).readAsBytesSync();
          var url = 'http://192.168.80.198:5000/predict';
          await http.post(Uri.parse(url), body: bytes).then((response) {
            Emotion = json.decode(response.body)['emotion'];
            print(Emotion);
          });
        });
      });
    });
    print("emotion:::$Emotion");
    return Emotion;
  }

  Future<String> startVideoCapture(CameraController controller) async {
    String Emotion;
    await controller.startVideoRecording();
    await Future.delayed(Duration(seconds: 5));
    final file = await controller.stopVideoRecording();
    final bytes = File(file.path).readAsBytesSync();
    var url = 'http://192.168.80.198:5001/predict';
    final response = await http.post(Uri.parse(url), body: bytes);
    print(response.statusCode);
    print(response.body);
    Emotion = json.decode(response.body)['emotion'];
    return Emotion;
  }

  predict(CameraController controller) async {
    String prediction;
  }
}
