import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  VoidCallback onInitializeComplete;
  SplashScreen({
    Key? key,
    required this.onInitializeComplete,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _runSplash();
  }

  _runSplash() {
    Future.delayed(Duration(seconds: 5))
        .then((value) => widget.onInitializeComplete());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // add MaterialApp widget here
      home: Scaffold(
        // wrap Scaffold widget here
        body: Center(
          child: Image.asset(
            'assets/images/mindwell.png',
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
