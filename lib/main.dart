import 'package:acadmy/screens/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import './screens/splash.dart';
import 'widgets/utils.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: "acadmy",
      home: MainPage(),
    );
  }
}

/*  home: AnimatedSplashScreen(
        splash: Splash(),
        nextScreen: MainPage(),
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
      ),*/
