import 'package:flutter/material.dart';
import 'package:mental_health_app/auth/provider/user_provider.dart';
import 'package:provider/provider.dart';

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
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomSliverAppBar(
            profilepic: user.profileImage,
          )
        ],
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
