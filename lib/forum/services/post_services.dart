import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/consts/colors.dart';
import 'package:mental_health_app/forum/models/post_model.dart';
import 'package:mental_health_app/services/notification_services.dart';

class PostServices {
  addPost(Post post, BuildContext context, String postId) async {
    var postToDB = await FirebaseFirestore.instance
        .collection('Posts')
        .doc(postId)
        .set(post.toMap())
        .onError((error, stackTrace) =>
            showSnackBar(error.toString(), context, Colors.red))
        .whenComplete(
            () => showSnackBar("Post added successfully", context, greenColor));
  }
}

class PostsProvider extends ChangeNotifier {
  PostsProvider() {
    getPosts();
  }
  List<Post> posts = [];
  late StreamSubscription _postsStream;
  getPosts() async {
    var snap = await FirebaseFirestore.instance.collection('Posts').snapshots();
    _postsStream = snap.listen((_snapshot) async {
      print(_snapshot.docs.length);
      posts = await Future.wait(
        _snapshot.docs.map((_d) async {
          Map<String, dynamic> data = _d.data() as Map<String, dynamic>;
          return Post.fromMap(data);
        }).toList(),
      );
      notifyListeners();
    });
  }
}
