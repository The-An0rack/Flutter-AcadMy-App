import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularPercent extends StatelessWidget {
  double percent;
  double radius;
  String label;
  double fontSize;

  CircularPercent(this.label, this.percent, this.radius, this.fontSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          CircularPercentIndicator(
            radius: radius,
            lineWidth: 10.0,
            percent: percent / 100,
            progressColor: ((percent >= 80)
                ? Colors.green
                : (percent >= 65)
                    ? Colors.orange
                    : Colors.red),
            circularStrokeCap: CircularStrokeCap.round,
            animation: true,
            center: Text(
              "${percent}%",
              style: GoogleFonts.inter(
                fontSize: fontSize + 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            "$label",
            style: GoogleFonts.inter(
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
