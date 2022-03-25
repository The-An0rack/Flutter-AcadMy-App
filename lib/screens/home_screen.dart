import 'package:acadmy/models/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/home_side_scroller.dart';
import '../widgets/quiz_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => UserProfile.fetchUserData(user!.email.toString()));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        /**/
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 40.0,
                      left: 10,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Hi There!!!",
                          style: GoogleFonts.inter(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          UserProfile.name,
                          style: GoogleFonts.inter(
                              fontSize: 30.0, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  HomeSideScroller(),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 16.0, bottom: 16.0),
                    child: Text(
                      "Short Quizzes",
                      style: GoogleFonts.inter(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  QuizList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
