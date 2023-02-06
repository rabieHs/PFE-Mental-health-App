import 'package:flutter/material.dart';

class SleepGridCard extends StatelessWidget {
  final Color color;
  final String title;
  const SleepGridCard({
    Key? key,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 0.4,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}
