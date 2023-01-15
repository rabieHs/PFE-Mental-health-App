import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mental_health_app/consts/colors.dart';
import 'package:mental_health_app/models/check_data.dart';
import 'package:mental_health_app/screens/analyse_screen.dart';
import 'package:mental_health_app/screens/home.dart';

import 'auth/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool? checked;

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bool val;
    checkUser().then((value) {
      checked = value;
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.cyan,
            fontFamily: 'Poppins'),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                print("yes data");

                if (checked == true) {
                  return const HomeScreen();

                  ///home Screen
                } else {
                  return AnalyseScreen();
                }
              } else if (snapshot.hasError) {
                return (Center(
                  child: Text('${snapshot.error}'),
                ));
              }
            }

            return const Login();
          },
        ));
  }
}
