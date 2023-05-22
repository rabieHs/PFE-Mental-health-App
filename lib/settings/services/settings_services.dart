import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/auth/screens/login.dart';

class SettingsServices {
  signOut(BuildContext context) async {
    final auth = FirebaseAuth.instance;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              title: Center(
                child: Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              content: Text(
                "Are you sure to Log out ?",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                TextButton(
                    onPressed: () async {
                      await auth.signOut().then((value) => Navigator.of(context)
                          .pushReplacement(
                              MaterialPageRoute(builder: (_) => Login())));
                    },
                    child: Text(
                      "Log Out",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ));
  }
}
