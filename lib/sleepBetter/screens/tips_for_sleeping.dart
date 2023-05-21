// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:mental_health_app/sleepBetter/services/tips_services.dart';

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
      body: FutureBuilder(
        future: SleepTipsServices().getTips(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return TipCard(
                    index: index,
                    title: data[index].title,
                    content: data[index].content,
                  );
                });
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text("No Data"),
            );
          }
        },
      ),
    );
  }
}

class TipCard extends StatefulWidget {
  final String title;
  final String content;
  final int index;
  const TipCard({
    Key? key,
    required this.title,
    required this.content,
    required this.index,
  }) : super(key: key);

  @override
  State<TipCard> createState() => _TipCardState();
}

class _TipCardState extends State<TipCard> {
  bool startAnimating = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimating = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 200 + (widget.index * 100)),
        transform: Matrix4.translationValues(
            startAnimating ? 0 : MediaQuery.of(context).size.width, 0, 0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.antiAlias,
          child: ExpansionTile(
            collapsedTextColor: Colors.white,
            textColor: Colors.white,
            backgroundColor: nightBlue2,
            collapsedIconColor: Colors.white,
            iconColor: Colors.white,
            collapsedBackgroundColor: nightBlue1,
            title: Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            childrenPadding: EdgeInsets.all(4),
            children: [
              Text(
                widget.content,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ));
  }
}
