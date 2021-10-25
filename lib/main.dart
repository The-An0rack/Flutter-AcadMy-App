import 'screens/splash.dart';
import 'package:flutter/material.dart';

import './screens/home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

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
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
