import 'package:flutter/material.dart';
import 'package:mental_health_app/consts/colors.dart';
import 'package:mental_health_app/feed/widgets/check_button.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
  }) : super(key: key);

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
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
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
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      CheckButton(
                          isActive: true,
                          description: "Write a motivation letter"),
                      CheckButton(
                          isActive: false, description: "1hour of sport"),
                      CheckButton(
                          isActive: false, description: "Drink 3L of Water"),
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
