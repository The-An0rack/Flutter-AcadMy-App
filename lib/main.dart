import 'package:acadmy/screens/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import './screens/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "acadmy",
      /*  home: AnimatedSplashScreen(
        splash: Splash(),
        nextScreen: MainPage(),
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
      ),*/
      home: MainPage(),
    );
  }
}
