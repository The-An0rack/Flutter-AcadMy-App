import 'package:acadmy_app/data/device_details.dart';
import 'package:acadmy_app/screens/dashboard.dart';
import 'package:acadmy_app/screens/homepage.dart';
import 'package:acadmy_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import 'screens/signin_screen.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
              displayLarge:
                  TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
              displayMedium:
                  TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              displaySmall:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              headline1: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
      routes: {
        HomePage.routeName: (context) => HomePage(),
        SignInScreen.routeName: (context) => const SignInScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        Dashboard.routeName: (context) => Dashboard(),
      },
      title: "AcadMy",
      debugShowCheckedModeBanner: false,
    ),
  );
}
