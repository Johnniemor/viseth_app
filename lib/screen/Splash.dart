import 'package:flutter/material.dart';
import 'package:rescue_project_app/screen/Home.dart';
import 'package:splashscreen/splashscreen.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: Homescreen(),
      title: const Text(
        'Hello',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
      image: Image.asset("assets/images/logo1.png"),
      gradientBackground: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.indigo, Colors.blue, Colors.lightBlue]),
      photoSize: 100.0,
    );
  }
}
