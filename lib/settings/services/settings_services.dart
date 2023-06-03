import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_app/auth/screens/login.dart';
import 'package:intl/intl.dart';

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

  Future<List<Map<String, dynamic>>> fetchMonthlyMoodData(String uid) async {
    final collection = FirebaseFirestore.instance
        .collection('Users')
        .doc(uid)
        .collection("Statics");
    final querySnapshot = await collection.get();
    final moodData = querySnapshot.docs.map((doc) => doc.data()).toList();

    // Group data by month
    Map<String, List<Map<String, dynamic>>> monthlyData = {};
    moodData.forEach((mood) {
      DateTime timestamp = mood['checkTime'].toDate();
      String monthYear = DateFormat('MM/yyyy').format(timestamp);
      print(monthYear);

      if (monthlyData.containsKey(monthYear)) {
        monthlyData[monthYear]!.add(mood);
      } else {
        monthlyData[monthYear] = [mood];
      }
    });

    // Calculate mood statistics for each month
    List<Map<String, dynamic>> processedData = [];
    monthlyData.forEach((monthYear, moodList) {
      int anxietyCount = 0;
      int depressionCount = 0;
      int stressCount = 0;
      int normalCount = 0;

      moodList.forEach((mood) {
        if (mood['Mood'] == 'Anxiety') {
          anxietyCount++;
        } else if (mood['Mood'] == 'Depression') {
          depressionCount++;
        } else if (mood['Mood'] == 'Stress') {
          stressCount++;
        } else if (mood['Mood'] == 'Normal') {
          normalCount++;
        }
      });

      Map<String, dynamic> monthlyStats = {
        'monthYear': monthYear,
        'anxiety': anxietyCount,
        'depression': depressionCount,
        'stress': stressCount,
        'normal': normalCount,
      };

      processedData.add(monthlyStats);
    });

    // Provide default values for mood categories with a count of zero
    List<String> moodCategories = ['anxiety', 'depression', 'stress', 'normal'];
    processedData.forEach((data) {
      moodCategories.forEach((category) {
        if (!data.containsKey(category)) {
          data[category] = 0;
        }
      });
    });

    return processedData;
  }
}
