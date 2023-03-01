import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mental_health_app/auth/provider/user_provider.dart';
import 'package:mental_health_app/auth/services/auth_services.dart';
import 'package:mental_health_app/feed/models/tasks.dart';
import 'package:mental_health_app/feed/services/feed_services.dart';
import 'package:mental_health_app/feed/services/tasks_services.dart';
import 'package:mental_health_app/feed/widgets/meditation_card.dart';
import 'package:mental_health_app/feed/widgets/sleep_card.dart';
import 'package:mental_health_app/quotes/models/quotes_model.dart';
import 'package:mental_health_app/quotes/services/quotes_services.dart';
import 'package:mental_health_app/quotes/widgets/quotes_card.dart';
import 'package:mental_health_app/sleepBetter/screens/better_sleep_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../widgets/mood_lever.dart';
import '../widgets/task_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late TasksServices _tasksServices;
  List<Tasks> tasks = [];
  List<Quotes> quotes = [];
  bool startAnimating = false;
  String mood = "";

  @override
  void initState() {
    final QuotesServices quotesServices = QuotesServices();
    // TODO: implement initState
    super.initState();
    _tasksServices = TasksServices();

    initTasks();
    getQuotes();
    setState(() {});
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimating = true;
      });
    });
  }

  getQuotes() async {
    final QuotesServices quotesServices = QuotesServices();
    quotes = await quotesServices.getQuotes();
    print("quotes length: ${quotes.length}");
    setState(() {});
  }

  initTasks() async {
    tasks = await _tasksServices.getTasks1();

    print(tasks.last.title);
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context).user;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Welcome Back, ",
                  style: TextStyle(fontSize: 27),
                ),
                Text(
                  user.username,
                  style: const TextStyle(
                      fontSize: 27, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.topLeft,
              height: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "How are you feeling today ?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const MoodLevel()
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Today's Task",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 30,
            ),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 300 + (0 * 100)),
                  transform: Matrix4.translationValues(
                      startAnimating ? 0 : MediaQuery.of(context).size.width,
                      0,
                      0),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: TaskCard(),
                  ),
                ),
                AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 300 + (1 * 100)),
                  transform: Matrix4.translationValues(
                      startAnimating ? 0 : MediaQuery.of(context).size.width,
                      0,
                      0),
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: quotes.isEmpty
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: Colors.white10,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 75,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            )
                          : QuotesCard(
                              quotes: quotes,
                            )),
                ),
                AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 300 + (2 * 100)),
                  transform: Matrix4.translationValues(
                      startAnimating ? 0 : MediaQuery.of(context).size.width,
                      0,
                      0),
                  child: const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: MeditationCard()),
                ),
                AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 300 + (3 * 100)),
                  transform: Matrix4.translationValues(
                      startAnimating ? 0 : MediaQuery.of(context).size.width,
                      0,
                      0),
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const BetterSleepScreen())),
                          child: const SleepCard())),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
