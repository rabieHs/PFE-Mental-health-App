import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mental_health_app/auth/model/user.dart' as model;

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
}
