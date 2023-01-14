import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnalyseScreen extends StatefulWidget {
  const AnalyseScreen({super.key});

  @override
  State<AnalyseScreen> createState() => _AnalyseScreenState();
}

class _AnalyseScreenState extends State<AnalyseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: ElevatedButton(
          onPressed: check,
          child: Center(
            child: Text("check"),
          ),
        ),
      ),
    );
  }

  void check() async {
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
        "Mood": "null",
        "isChecked": true,
      });
    } else {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Statics")
          .doc(id)
          .update({"isChecked": true});
    }
  }
}
