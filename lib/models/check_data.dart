// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CheckData {
  final bool isChecked;
  final String Mood;
  final DateTime checkTime;

  CheckData(
      {required this.isChecked, required this.Mood, required this.checkTime});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isChecked': isChecked,
      'Mood': Mood,
      'checkTime': checkTime.millisecondsSinceEpoch,
    };
  }

  factory CheckData.fromMap(Map<String, dynamic> map) {
    return CheckData(
      isChecked: map['isChecked'] as bool,
      Mood: map['Mood'] as String,
      checkTime: DateTime.fromMillisecondsSinceEpoch(map['checkTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckData.fromJson(String source) =>
      CheckData.fromMap(json.decode(source) as Map<String, dynamic>);
}
