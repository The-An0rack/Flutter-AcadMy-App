import '../widgets/home_side_scroller.dart';
import '../widgets/quiz_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          //Custum app Bar
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap: () {}, child: Icon(Icons.menu)),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage('assets/image/user.jpg'),
                      )),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back!",
                  style: GoogleFonts.inter(
                      fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Hannah Baker",
                  style: GoogleFonts.inter(
                      fontSize: 30.0, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),

          HomeSideScroller(),

          Padding(
            padding: const EdgeInsets.only(top: 20, left: 16.0, bottom: 16.0),
            child: Text(
              "Short Quizzes",
              style: GoogleFonts.inter(
                  fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
          ),

          QuizList(),
        ],
      ),
    );
  }
}
