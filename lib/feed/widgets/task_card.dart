import 'package:flutter/material.dart';
import 'package:mental_health_app/consts/colors.dart';
import 'package:mental_health_app/feed/models/tasks.dart';
import 'package:mental_health_app/feed/services/tasks_services.dart';
import 'package:mental_health_app/feed/widgets/check_button.dart';
import 'package:mental_health_app/feed/widgets/shimmer_widget.dart';
import 'package:shimmer/shimmer.dart';

class TaskCard extends StatefulWidget {
  final String mood;
  const TaskCard({
    Key? key,
    required this.mood,
  }) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  final TasksServices _tasksServices = TasksServices();
  List<Tasks>? tasks;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTasks();
  }

  getTasks() async {
    tasks = await _tasksServices.saveDatalocally(widget.mood);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170,
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
                      : ListView(
                          shrinkWrap: true,
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
