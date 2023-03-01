import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/forum/models/post_model.dart';
import 'package:mental_health_app/services/notification_services.dart';

import '../../core/theme/colors.dart';
import '../models/comment_model.dart';

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

  addComment(String postId, Comment comment) async {
    await FirebaseFirestore.instance
        .collection('Posts')
        .doc(postId)
        .collection('Comments')
        .doc()
        .set(comment.toMap());
  }

  Stream<QuerySnapshot> getComment(String postId) {
    return FirebaseFirestore.instance
        .collection('Posts')
        .doc(postId)
        .collection('Comments')
        .orderBy('time')
        .snapshots();
  }

  Future<String> getCommentLength(String postId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Posts')
        .doc(postId)
        .collection('Comments')
        .get();
    final List<Comment> commentList = snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Comment.fromMap(data);
    }).toList();
    print(commentList.length);

    return commentList.length.toString();
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

  bool checkLike(String uid, List likes) {
    if (likes.contains(uid)) {
      return true;
    } else {
      return false;
    }
  }

  void likePost(String postId, String uid, List likes) async {
    if (likes.contains(uid)) {
      await FirebaseFirestore.instance.collection('Posts').doc(postId).update({
        'likes': FieldValue.arrayRemove([uid])
      });
    } else {
      await FirebaseFirestore.instance.collection('Posts').doc(postId).update({
        'likes': FieldValue.arrayUnion([uid])
      });
    }
  }
}
