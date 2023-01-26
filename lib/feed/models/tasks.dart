// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Tasks {
  final String title;
  bool isCompleted;

  Tasks({required this.title, required this.isCompleted});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isCompleted': isCompleted,
    };
  }

  factory Tasks.fromMap(Map<String, dynamic> map) {
    return Tasks(
      title: map['title'],
      isCompleted: map['isCompleted'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Tasks.fromJson(String source) =>
      Tasks.fromMap(json.decode(source) as Map<String, dynamic>);

  Tasks copyWith({
    String? title,
    bool? isCompleted,
  }) {
    return Tasks(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
