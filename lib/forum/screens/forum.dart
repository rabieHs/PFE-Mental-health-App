import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mental_health_app/consts/colors.dart';

import '../widgets/custom_sliver_appbar.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) =>
            [CustomSliverAppBar()],
        body: ListView(
          children: [
            Container(
              color: Colors.black,
              height: 265,
              width: MediaQuery.of(context).size.width,
              child: Column(children: []),
            ),
            Container(
              color: Colors.black,
              height: 265,
              width: MediaQuery.of(context).size.width,
              child: Column(children: []),
            ),
            Container(
              color: Colors.black,
              height: 265,
              width: MediaQuery.of(context).size.width,
              child: Column(children: []),
            ),
            Container(
              color: Colors.black,
              height: 265,
              width: MediaQuery.of(context).size.width,
              child: Column(children: []),
            )
          ],
        ),
      ),
    );
  }
}
