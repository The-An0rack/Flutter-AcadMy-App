// import 'package:acadmy_app/model/test_details.dart';
import 'package:acadmy_app/firebase_options.dart';
import 'package:acadmy_app/screens/dashboard.dart';
import 'package:acadmy_app/screens/mock_test.dart';
import 'package:acadmy_app/screens/result_screen.dart';
import 'package:acadmy_app/screens/signup_screen.dart';
import 'package:acadmy_app/screens/subjects_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'screens/signin_screen.dart';
import 'screens/welcome.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          displaySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
          headlineSmall: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          titleSmall: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      routes: {
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        HomePage.routeName: (context) => const HomePage(),
        SignInScreen.routeName: (context) => const SignInScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        Dashboard.routeName: (context) => const Dashboard(),
        MockTestScreen.routeName: (context) => const MockTestScreen(),
        SubjectsTest.routeName: (context) => SubjectsTest(
              subjectCode: 7,
            ),
        ResultScreen.routeName: (context) => ResultScreen()
      },
      title: "AcadMy",
      debugShowCheckedModeBanner: false,
    ),
  );
}
