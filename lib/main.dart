import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rescue_project_app/screen/Home.dart';
import 'package:rescue_project_app/screen/stuff/staff.dart';
import 'constant/custom_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RescueApp',
        theme: ThemeData(
          primarySwatch: CustomColors.blue,
        ),
        home: Homescreen());
  }
}
