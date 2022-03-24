import 'package:acadmy/dummy_data/profile_data.dart';
import 'package:acadmy/models/user_profile.dart';
import 'package:acadmy/widgets/circular_percent_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 24,
            ),
            Container(
              height: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.network(
                  "https://cdn.pixabay.com/photo/2016/08/31/11/54/user-1633249_1280.png",
                  //"${user!.photoURL.toString()}",
                ),
              ),
            ),
            Container(
              child: Text(
                "${UserProfile.name}",
                //user!.email.toString(),
                style: GoogleFonts.inter(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(
                // "Batch: ${UserProfile.batch}",
                "Batch: TargetSDE",
                style: GoogleFonts.inter(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CircularPercent("Accuracy", UserProfile.accuracy, 150, 25),
            SizedBox(
              height: 50,
            ),
            Container(
              child: SizedBox(
                height: 140,
                child: Center(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: UserProfile.subAcc.length,
                      itemBuilder: (context, index) {
                        return CircularPercent(
                          UserProfile.subList[index],
                          UserProfile.subAcc[index],
                          100.0,
                          15.0,
                        );
                      }),
                ),
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50)),
              onPressed: () => FirebaseAuth.instance.signOut(),
              icon: const Icon(
                Icons.arrow_back,
                size: 32,
              ),
              label: const Text(
                'Sign Out',
                style: TextStyle(fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}
