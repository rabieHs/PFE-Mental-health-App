// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String username;
  final String email;
  final String uid;
  final String profileImage;

  User(
      {required this.profileImage,
      required this.username,
      required this.email,
      required this.uid});
  Map<String, dynamic> ToJson() => {
        "username": username,
        "email": email,
        "uid": uid,
        "profileImage": profileImage
      };

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'uid': uid,
      'profileImage': profileImage
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      profileImage: map['profileImage'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
