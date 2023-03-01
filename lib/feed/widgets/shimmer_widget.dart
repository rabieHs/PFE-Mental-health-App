import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mental_health_app/core/theme/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key, required this.height, required this.widht});
  final double height;
  final double widht;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.green,
        highlightColor: Colors.greenAccent,
        child: Container(
          width: widht,
          height: height,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
        ));
  }
}

class ShimmerWidgetGrey extends StatelessWidget {
  const ShimmerWidgetGrey(
      {super.key, required this.height, required this.widht});
  final double height;
  final double widht;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: greyColor,
        direction: ShimmerDirection.ltr,
        highlightColor: Colors.white,
        child: Container(
          width: widht,
          height: height,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
        ));
  }
}
