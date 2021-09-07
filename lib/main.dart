import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acadmy_app/screens/home.dart';

import 'screens/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: AnimatedSplashScreen(
        splash: Splash(),
        nextScreen: Homepage(),
        duration: 1500,
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
