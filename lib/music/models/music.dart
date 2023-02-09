// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Music {
  final String title;
  final String image;
  final String url;
  final int listen;
  final String Duration;
  final String docId;

  Music(
      {required this.listen,
      required this.docId,
      required this.Duration,
      required this.title,
      required this.image,
      required this.url});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'image': image,
      'url': url,
      'duration': Duration,
      'listen': listen,
      'docId': docId
    };
  }

  factory Music.fromMap(Map<String, dynamic> map) {
    return Music(
      docId: map['docId'] as String,
      listen: map['listen'] as int,
      Duration: map['duration'] as String,
      title: map['title'] as String,
      image: map['image'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Music.fromJson(String source) =>
      Music.fromMap(json.decode(source) as Map<String, dynamic>);
}
