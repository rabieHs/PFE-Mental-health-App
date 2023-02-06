import 'package:flutter/material.dart';

class TopListenedCard extends StatelessWidget {
  final Color color;
  const TopListenedCard({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.43,
      height: MediaQuery.of(context).size.height * 0.23,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            'assets/images/meditation_card.png',
            height: 70,
            width: 70,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Reflection",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '10 Mins',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  color: Colors.white),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.17,
              height: MediaQuery.of(context).size.height * 0.035,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text("Start"),
              ),
            )
          ],
        )
      ]),
    );
  }
}
