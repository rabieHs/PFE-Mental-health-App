import 'package:flutter/material.dart';

import '../widgets/custom_sliver_appbar.dart';
import '../widgets/post_card.dart';

class ForumScreen extends StatefulWidget {
  const ForumScreen({super.key});

  @override
  State<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) =>
            [CustomSliverAppBar()],
        body: ListView(
          shrinkWrap: true,
          children: [
            PostCard(),
            PostCard(),
            PostCard(),
            PostCard(),
            PostCard(),
          ],
        ),
      ),
    );
  }
}
