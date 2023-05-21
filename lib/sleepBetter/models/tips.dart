import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Tips {
  final String title;
  final String content;
  Tips({
    required this.title,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
    };
  }

  factory Tips.fromMap(Map<String, dynamic> map) {
    return Tips(
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tips.fromJson(String source) =>
      Tips.fromMap(json.decode(source) as Map<String, dynamic>);
}
