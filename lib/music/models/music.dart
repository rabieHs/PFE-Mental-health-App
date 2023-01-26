// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Music {
  final String title;
  final String image;
  final String url;

  Music({required this.title, required this.image, required this.url});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'image': image,
      'url': url,
    };
  }

  factory Music.fromMap(Map<String, dynamic> map) {
    return Music(
      title: map['title'] as String,
      image: map['image'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Music.fromJson(String source) =>
      Music.fromMap(json.decode(source) as Map<String, dynamic>);
}
