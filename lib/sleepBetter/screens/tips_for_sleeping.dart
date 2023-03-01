import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../core/theme/colors.dart';

class TipsForSleepingScreen extends StatefulWidget {
  const TipsForSleepingScreen({super.key});

  @override
  State<TipsForSleepingScreen> createState() => _TipsForSleepingScreenState();
}

class _TipsForSleepingScreenState extends State<TipsForSleepingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Tips for sleeping"),
      ),
      body: ListView(children: [
        TipCard(),
        TipCard(),
        TipCard(),
        TipCard(),
        TipCard(),
        TipCard(),
        TipCard(),
        TipCard(),
        TipCard(),
        TipCard(),
        TipCard(),
        TipCard(),
        TipCard(),
      ]),
    );
  }
}

class TipCard extends StatelessWidget {
  const TipCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        collapsedTextColor: Colors.white,
        textColor: Colors.white,
        backgroundColor: secondaryColor,
        collapsedIconColor: primaryColor,
        collapsedBackgroundColor: secondaryColor,
        title: Text('title1'),
        childrenPadding: EdgeInsets.all(4),
        children: [
          Text(
              "data data ata data data data data data data data data data data data data data data data data data")
        ],
      ),
    );
  }
}
