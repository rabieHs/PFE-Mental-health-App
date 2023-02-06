import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class feedServices {
  getUserMood(String uid) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection('Statics')
        .orderBy('checkTime', descending: true)
        .limit(1)
        .get();
    print(snapshot.docs.first.data()['Mood']);
    return snapshot.docs.first.data()['Mood'];
  }
}
