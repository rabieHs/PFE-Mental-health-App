import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Post {
  final String username;
  final String profilePic;
  final Timestamp date;
  final String title;
  final String content;
  final String uid;
  final String postId;
  final Likes;

  Post({
    this.Likes,
    required this.username,
    required this.uid,
    required this.profilePic,
    required this.date,
    required this.title,
    required this.content,
    required this.postId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'profilePic': profilePic,
      'date': date,
      'title': title,
      'content': content,
      'uid': uid,
      'postId': postId,
      'likes': Likes
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      postId: map['postId'] as String,
      username: map['username'] as String,
      profilePic: map['profilePic'] as String,
      date: map['date'],
      title: map['title'] as String,
      content: map['content'] as String,
      uid: map['uid'] as String,
      Likes: map['likes'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);
}
