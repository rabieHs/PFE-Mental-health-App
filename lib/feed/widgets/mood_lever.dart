import 'package:flutter/material.dart';
import 'package:mental_health_app/consts/colors.dart';

class MoodLevel extends StatelessWidget {
  const MoodLevel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: 60,
                height: 60,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  "assets/images/verysad.png",
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Very Sad",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins'),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: 60,
                height: 60,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  "assets/images/sad.png",
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Sad",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins'),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(2),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: primaryColor),
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset(
                  "assets/images/natural.png",
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Natural",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: primaryColor),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: 60,
                height: 60,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  "assets/images/happy2.png",
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Happy",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins'),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: 60,
                height: 60,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  "assets/images/veryhappy.png",
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Very Happy",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
