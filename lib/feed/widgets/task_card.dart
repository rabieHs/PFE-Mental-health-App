import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/feed/models/tasks.dart';
import 'package:mental_health_app/feed/services/tasks_services.dart';
import 'package:mental_health_app/feed/widgets/check_button.dart';
import 'package:mental_health_app/feed/widgets/shimmer_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../auth/services/auth_services.dart';
import '../../core/theme/colors.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  final TasksServices _tasksServices = TasksServices();
  List<Tasks>? tasks;
  String mood = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getTasks();
  }

  getTasks() async {
    tasks = await _tasksServices.saveDatalocally(await AuthServices()
        .getUserMood(FirebaseAuth.instance.currentUser!.uid));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: greenColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Tasks",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  width: 180,
                  child: tasks == null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShimmerWidget(height: 10, widht: 10),
                                ShimmerWidget(height: 10, widht: 155)
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShimmerWidget(height: 10, widht: 10),
                                ShimmerWidget(height: 10, widht: 155)
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ShimmerWidget(height: 10, widht: 10),
                                ShimmerWidget(height: 10, widht: 155)
                              ],
                            )
                          ],
                        )
                      : Column(
                          children: [
                            GestureDetector(
                              onDoubleTap: () {
                                _tasksServices.updateTaskStatus(tasks![0], 0);
                                setState(() {
                                  tasks![0].isCompleted =
                                      !tasks![0].isCompleted;
                                });
                              },
                              child: CheckButton(
                                  isActive: tasks![0].isCompleted,
                                  description: tasks![0].title),
                            ),
                            GestureDetector(
                              onDoubleTap: () {
                                _tasksServices.updateTaskStatus(tasks![1], 1);
                                setState(() {
                                  tasks![1].isCompleted =
                                      !tasks![1].isCompleted;
                                });
                              },
                              child: CheckButton(
                                  isActive: tasks![1].isCompleted,
                                  description: tasks![1].title),
                            ),
                            GestureDetector(
                              onDoubleTap: () {
                                _tasksServices.updateTaskStatus(tasks![2], 2);
                                setState(() {
                                  tasks![2].isCompleted =
                                      !tasks![2].isCompleted;
                                });
                              },
                              child: CheckButton(
                                  isActive: tasks![2].isCompleted,
                                  description: tasks![2].title),
                            ),
                          ],
                        ),
                ),
              ],
            ),
            Image.asset(
              "assets/images/to-do-list.png",
              width: 80,
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
