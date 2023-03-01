// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;

  const CustomButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

class OnboardingDynamicCustomButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;

  const OnboardingDynamicCustomButton({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.arrow_forward_sharp,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
