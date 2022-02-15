import 'package:acadmy/dummy_data/profile_data.dart';
import 'package:acadmy/widgets/circular_percent_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.network(
                  "${userDat.pic_url}",
                ),
              ),
            ),
            Container(
              child: Text(
                "${userDat.name}",
                style: GoogleFonts.inter(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(
                "Batch: ${userDat.batch}",
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
            CircularPercent("Accuracy", userDat.accuracy, 150, 25),
            SizedBox(
              height: 50,
            ),
            Container(
              child: SizedBox(
                height: 140,
                child: Center(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: userDat.sub_scc.length,
                      itemBuilder: (context, index) {
                        return CircularPercent(
                            userDat.sub_scc[index].keys.first,
                            userDat.sub_scc[index].values.first,
                            100.0,
                            15.0);
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
