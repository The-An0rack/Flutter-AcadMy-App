// import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/utils.dart';
// import 'package:flutter/material.dart';

class AuthService {
  //Handle Authentication
  static Future<void> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    } on Exception catch (e) {
      Utils.showSnackBar(e.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }

  static Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }
}
