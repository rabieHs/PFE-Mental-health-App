// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String content;
  final String username;
  final String profilepic;
  final String uid;
  final Timestamp time;

  Comment(
      {required this.content,
      required this.username,
      required this.profilepic,
      required this.uid,
      required this.time});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
      'username': username,
      'profilepic': profilepic,
      'uid': uid,
      'time': time,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      content: map['content'] as String,
      username: map['username'] as String,
      profilepic: map['profilepic'] as String,
      uid: map['uid'] as String,
      time: map['time'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);
}
