import 'package:flutter/material.dart';
import 'package:mental_health_app/auth/provider/user_provider.dart';
import 'package:mental_health_app/forum/services/post_services.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final posts = context.watch<PostsProvider>().posts;
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
          body: posts == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : posts.length == 0
                  ? Center(
                      child: Text("No Posts"),
                    )
                  : ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        return PostCard(
                          post: posts[index],
                        );
                      })),
    );
  }
}
