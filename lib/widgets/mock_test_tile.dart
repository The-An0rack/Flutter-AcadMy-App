import 'dart:math';

import 'package:acadmy_app/data/device_details.dart';
import 'package:acadmy_app/screens/mock_test.dart';
import 'package:flutter/material.dart';

List<Color> _colorList = [
  // Colors.redAccent,
  // Colors.purpleAccent,
  Colors.lightGreenAccent,
  Colors.lightBlueAccent,
  Colors.yellow,
  // Colors.pinkAccent,
  Colors.orangeAccent
];

Widget mockTestTile(BuildContext context, String title, int totalQue) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, MockTestScreen.routeName);
    },
    child: Container(
      height: DeviceDetails.height * 0.2,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      width: DeviceDetails.width * 0.65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            offset: const Offset(5.0, 5.0),
            spreadRadius: 2,
            blurRadius: 10,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            spreadRadius: 0,
            blurRadius: 0,
          ),
        ],
        color: _colorList[Random().nextInt(_colorList.length)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text("Que.: $totalQue")
        ],
      ),
    ),
  );
}
