// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Quotes {
  final String title;
  final String author;
  final String image;

  Quotes({required this.title, required this.author, required this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'author': author,
      'image': image,
    };
  }

  factory Quotes.fromMap(Map<String, dynamic> map) {
    return Quotes(
      title: map['title'] as String,
      author: map['author'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Quotes.fromJson(String source) =>
      Quotes.fromMap(json.decode(source) as Map<String, dynamic>);
}
