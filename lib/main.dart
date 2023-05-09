import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mental_health_app/analyse/screens/text_classification.dart';
import 'package:mental_health_app/auth/provider/user_provider.dart';
import 'package:mental_health_app/auth/services/auth_services.dart';

import 'package:mental_health_app/analyse/screens/emotion_recognition_screen.dart';
import 'package:mental_health_app/core/theme/theme.dart';
import 'package:mental_health_app/forum/services/post_services.dart';
import 'package:mental_health_app/onboadring/screens/onboarding_screen.dart';
import 'package:mental_health_app/onboadring/splash/screen/splash_screen.dart';
import 'package:mental_health_app/screens/analyse_screen.dart';
import 'package:mental_health_app/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'analyse/models/questions.dart';
import 'analyse/screens/quiz_screen.dart';
import 'auth/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final isView = preferences.getInt('OnBoard');
  print(isView);
  runApp(
    SplashScreen(onInitializeComplete: () {
      runApp(isView != null
          ? MultiProvider(providers: [
              ChangeNotifierProvider(create: (context) => UserProvider()),
              ChangeNotifierProvider(create: (context) => PostsProvider()),
            ], child: const MyApp())
          : const OnBoardingScreen());
    }),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthServices authServices = AuthServices();
  // This widget is the root of your application.
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool? checked;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bool val;
    authServices.checkUser().then((value) {
      checked = value;
      print("checked: $value");
      authServices.getUserData(context);
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
    return MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  print("yes data");

                  if (checked == false) {
                    return TextClassificationScreen(
                        emotion: "Sad"); //EmotionRecognitionScreen();
                  } else {
                    return const HomeScreen(); //home
                  }
                } else if (snapshot.hasError) {
                  return (Center(
                    child: Text('${snapshot.error}'),
                  ));
                }
              }

              return const Login();
            },
          )),
    );
  }
}
