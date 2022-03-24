import 'package:acadmy/models/user_profile.dart';
import 'package:acadmy/screens/mainpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:animated_splash_screen/animated_splash_screen.dart';

//import './screens/splash.dart';
import 'screens/login_page.dart';
import 'widgets/utils.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

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
      home: Scaffold(
        body:
            LoginPage(), /*StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Something went wrong!!!"),
              );
            } else if (snapshot.hasData) {
              UserProfile.fetchUserData(snapshot.data!.email.toString());

              return MainPage();
            } else {
              return LoginPage();
            }
          },
        ),
      ),*/
      ),
    );
  }
}
/*void main() => runApp(MyApp());

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
*/
/*  home: AnimatedSplashScreen(
        splash: Splash(),
        nextScreen: MainPage(),
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
      ),*/
