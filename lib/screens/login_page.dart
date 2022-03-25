import 'package:acadmy/screens/mainpage.dart';
import 'package:acadmy/screens/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_auth_email/main.dart';
//import 'package:firebase_auth_email/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import './homepage.dart';

import '../main.dart';
import '../models/user_profile.dart';
import '../widgets/utils.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            "AcadMy",
            style: GoogleFonts.getFont(
              'Archivo',
              fontSize: 50.0,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            "Your partner in acheiving excellence!!!",
            style: GoogleFonts.getFont(
              'Permanent Marker',
              fontSize: 15.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          TextField(
            controller: emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(
            height: 4,
          ),
          TextField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            icon: const Icon(Icons.lock_open, size: 32),
            label: const Text(
              'Sign-in',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: signIn,
          ),
          const SizedBox(
            height: 24,
          ),
          GestureDetector(
            child: const Text(
              'Forgot Password',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ForgotPasswordPage(),
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Do not have an account? "),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SignUpPage()));
                  },
                  child: const Text("Sign Up"))
            ],
          ),
        ],
      ),
    );
  }

  Future signIn() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      setState(() {
        UserProfile.subQue = UserProfile.initSubQue();
        UserProfile.email = emailController.text.trim();
        UserProfile.fetchUserData(emailController.text.trim());
      });

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }

    //navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
