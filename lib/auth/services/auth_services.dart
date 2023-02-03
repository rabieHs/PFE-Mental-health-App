import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mental_health_app/auth/model/user.dart' as model;
import 'package:mental_health_app/auth/provider/user_provider.dart';
import 'package:provider/provider.dart';

class AuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String?> cretaUser(
      String _username, String _email, String _password) async {
    String res = "some error occurred";
    try {
      if (_email.isNotEmpty || _password.isNotEmpty || _username.isEmpty) {
        UserCredential credential = await auth.createUserWithEmailAndPassword(
            email: _email, password: _password);
        saveUser(_username, _email, _password, credential.user!.uid);
        res = "sucess";
      } else {
        res = "please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String?> loginUser(String _email, String _password) async {
    String res = "some error occurred";
    try {
      if (_email.isNotEmpty || _password.isNotEmpty) {
        UserCredential credential = await auth.signInWithEmailAndPassword(
            email: _email, password: _password);
        res = "sucess";
      } else {
        res = "please enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> saveUser(
      String _username, String _email, String _password, String _uid) async {
    try {
      model.User user = model.User(
        username: _username,
        email: _email,
        uid: _uid,
      );
      await firestore.collection('Users').doc(_uid).set(user.ToJson());
      await firestore
          .collection("Users")
          .doc(_uid)
          .collection("Statics")
          .doc()
          .set(
        {
          "checkTime": DateTime.now(),
          "Mood": "null",
          "isChecked": false,
        },
      );
    } catch (e) {
      print("save error : $e");
    }
  }

  void getUserData(BuildContext context) async {
    print("getting user data runned");
    try {
      final userId = await FirebaseAuth.instance.currentUser!.uid;
      final _userDoc = await firestore.collection('Users').doc(userId).get();
      if (_userDoc != null) {
        print("user not null");
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        Map<String, dynamic> userdata = _userDoc.data() as Map<String, dynamic>;
        var user = model.User.fromMap(userdata);
        userProvider.setUserFromModel(user);

        print("name ${userProvider.user.username}");
      } else {
        print("user null");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<QuerySnapshot> getChecks() {
    return firestore
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .collection("Statics")
        .orderBy("checkTime", descending: true)
        .limit(1)
        .get();
  }

  Future<bool> checkUser() async {
    bool? compred;
    QuerySnapshot check = await getChecks();
    var snapshot = check.docs.first.data() as Map<String, dynamic>;
    DateTime checkTime = snapshot["checkTime"].toDate();
    bool isChecked = snapshot["isChecked"];
    if (isChecked == true && (checkTime.day == DateTime.now().day)) {
      print("true");
      compred = true;
    } else {
      compred = false;
    }

    return compred;
  }
}
