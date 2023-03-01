import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mental_health_app/analyse/services/quest_switcher.dart';

import 'package:mental_health_app/consts/widgets/custom_button.dart';

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
  TextEditingController _controller = TextEditingController();
  Classifier classifier = Classifier();
  List<String> statements = [];
  QuestSwitcher questSwitcher = QuestSwitcher();
  List<List<double>> ans = [
    [0.0, 0.0]
  ];

  bool isloading = true;
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
            SizedBox(
              height: 10,
            ),
            Text(
              "can you write a short paragraph about your day ?",
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _controller,
              minLines: 8,
              maxLines: 25,
              decoration: InputDecoration(
                  hintText: "write here...",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 10),
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(70)),
                child: Center(
                  child: Icon(
                    Icons.mic,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
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
                          SnackBar(
                            duration: const Duration(milliseconds: 500),
                            content: Text(
                              "Enter Statement",
                            ),
                          ),
                        );
                      }
                    },
                    child: CustomButton(text: "Next"))),
          ],
        ),
      ),
    );
  }
}
