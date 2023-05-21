import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mental_health_app/sleepBetter/models/tips.dart';

class SleepTipsServices {
  Future<List<Tips>> getTips() async {
    final snapshot = await FirebaseFirestore.instance
        .collection("Sleep")
        .doc("Tips")
        .collection("Tips")
        .get();

    final List<Tips> tips = snapshot.docs.map((e) {
      Map<String, dynamic> data = e.data() as Map<String, dynamic>;
      return Tips.fromMap(data);
    }).toList();
    return tips;
  }
}
