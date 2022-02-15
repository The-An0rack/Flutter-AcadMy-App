import 'package:flutter/material.dart';

import '../models/test_tile_data.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSideScroller extends StatelessWidget {
  const HomeSideScroller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return //Horizontal Cards
        Container(
      height: 200.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 16, right: 6),
          itemCount: testData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 20.0),
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Color(tests[index].background),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 30,
                    top: 30,
                    child: Text(
                      "Full Test: ",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 50,
                    top: 65,
                    child: Text(
                      tests[index].title,
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    right: 50,
                    child: Text(
                      "Q: " + tests[index].quenum.toString() + " Questions",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
