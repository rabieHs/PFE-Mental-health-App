// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Meditation {
  final String title;
  final String owner;
  final String duration;
  final String docId;
  final String url;
  final int listen;

  Meditation(
      {required this.title,
      required this.owner,
      required this.duration,
      required this.docId,
      required this.url,
      required this.listen});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'owner': owner,
      'duration': duration,
      'docId': docId,
      'url': url,
      'listen': listen,
    };
  }

  factory Meditation.fromMap(Map<String, dynamic> map) {
    return Meditation(
      title: map['title'] as String,
      owner: map['owner'] as String,
      duration: map['duration'] as String,
      docId: map['docId'] as String,
      url: map['url'] as String,
      listen: map['listen'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meditation.fromJson(String source) =>
      Meditation.fromMap(json.decode(source) as Map<String, dynamic>);
}
