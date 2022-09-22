import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Color _determineColor(double value) {
  value = value * 100;
  if (value > 85) {
    return Colors.green;
  } else if (value > 55) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}

Widget circularMeter(double value, BuildContext context, String subName) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: CircularPercentIndicator(
      radius: 60.0,
      lineWidth: 12.0,
      animation: true,
      animationDuration: 900,
      percent: value,
      circularStrokeCap: CircularStrokeCap.round,
      center: Text(
        "${(value * 100).toInt().toString()}%",
        style: Theme.of(context).textTheme.displayMedium,
      ),
      footer: Text(subName, style: Theme.of(context).textTheme.headlineMedium),
      progressColor: _determineColor(value),
    ),
  );
}
