import 'package:acadmy_app/data/sub_list.dart';
import 'package:acadmy_app/data/subject_images.dart';
import 'package:acadmy_app/screens/subject_test.dart';
import 'package:flutter/material.dart';

import '../mock_data/user_profile_data.dart';

Widget subjectTestTile(BuildContext context, int index) {
  return GestureDetector(
    onTap: () => Navigator.pushNamed(context, SubjectTest.routeName),
    child: Container(
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
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            child: Image.network(
              imageUrls[index],
              fit: BoxFit.cover,
            ),
          ),
          Text(SubjectList.subList[user.batch]![index]),
        ],
      ),
    ),
  );
}
