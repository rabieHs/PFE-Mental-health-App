import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/theme/colors.dart';

class ShimmerQuote extends StatelessWidget {
  const ShimmerQuote({super.key, required this.height, required this.widht});
  final double height;
  final double widht;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: greyColor,
        highlightColor: primaryColor,
        child: Container(
          width: widht,
          height: height,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
        ));
  }
}
