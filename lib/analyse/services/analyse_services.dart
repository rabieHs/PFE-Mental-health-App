import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AnalyseServices {
  void checkAndUpdateUserMood(String Mood) async {
    QuerySnapshot document = await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Statics")
        .orderBy('checkTime', descending: true)
        .limit(1)
        .get();

    print(document.docs.length);

    String id = document.docs.last.id;
    print(id);

    DateTime date = document.docs.first['checkTime'].toDate();

    if (date.day != DateTime.now().day) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Statics")
          .doc()
          .set({
        "checkTime": DateTime.now(),
        "Mood": Mood, //add the mood
        "isChecked": true,
      });
    } else {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Statics")
          .doc(id)
          .update({
        "isChecked": true,
        "Mood": Mood,
      });
    }
  }
}
