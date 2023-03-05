import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/analyse/services/quest_switcher.dart';
import 'package:mental_health_app/consts/widgets/custom_button.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../core/theme/colors.dart';
import '../services/text_classifier.dart';

class TextClassificationScreen extends StatefulWidget {
  final String emotion;
  const TextClassificationScreen({super.key, required this.emotion});

  @override
  State<TextClassificationScreen> createState() =>
      _TextClassificationScreenState();
}

class _TextClassificationScreenState extends State<TextClassificationScreen> {
  SpeechToText speechToText = SpeechToText();
  TextEditingController _controller = TextEditingController();
  Classifier classifier = Classifier();
  List<String> statements = [];
  QuestSwitcher questSwitcher = QuestSwitcher();
  List<List<double>> ans = [
    [0.0, 0.0]
  ];

  bool isloading = true;
  bool isLestinig = false;
  loadModel() async {
    await classifier.loadModel();
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel();
    statements.clear();
    ans.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "How About Your Day ?",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "can you write a short paragraph about your day ?",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _controller,
              minLines: 5,
              maxLines: 10,
              decoration: InputDecoration(
                  hintText: "write here...",
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 10),
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: AvatarGlow(
                endRadius: 70,
                animate: isLestinig,
                duration: const Duration(milliseconds: 1500),
                glowColor: primaryColor,
                repeat: true,
                repeatPauseDuration: const Duration(milliseconds: 1),
                showTwoGlows: true,
                child: GestureDetector(
                  onTapDown: (details) async {
                    if (!isLestinig) {
                      bool available = await speechToText.initialize();
                      if (available) {
                        setState(() {
                          isLestinig = true;
                          speechToText.listen(onResult: (result) {
                            setState(() {
                              _controller.text = result.recognizedWords;
                            });
                          });
                        });
                      }
                    }
                  },
                  onTapUp: (details) {
                    setState(() {
                      isLestinig = false;
                    });
                    speechToText.stop();
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(70)),
                    child: Center(
                      child: Icon(
                        isLestinig ? Icons.mic : Icons.mic_none,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.center,
                child: InkWell(
                    onTap: () async {
                      if (_controller.text.isNotEmpty) {
                        List<List<double>> temp =
                            await classifier.classify(_controller.text);
                        ans.add([temp[0][0], temp[0][1]]);
                        statements.add(_controller.text);
                        _controller.text = "";
                        setState(() {
                          if (ans[(statements.length - 1)][0] >
                              ans[(statements.length - 1)][1]) {
                            print("Negative -");
                            questSwitcher.switchController(
                                widget.emotion, 'Negative', context);
                          } else {
                            print("Positive +");
                            questSwitcher.switchController(
                                widget.emotion, 'Positive', context);
                          }
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 500),
                            content: Text(
                              "Enter Statement",
                            ),
                          ),
                        );
                      }
                    },
                    child: const CustomButton(text: "Next"))),
          ],
        ),
      ),
    );
  }
}
