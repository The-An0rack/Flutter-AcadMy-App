import 'package:flutter/material.dart';

import 'doubt_screen.dart';
import 'homescreen.dart';
import 'profile_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _indexBottom = 0;

  var tabs = [
    HomeScreen(),
    DoubtScreen(),
    ProfileScreen(),
  ];
  //Handle Indicator
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_indexBottom],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexBottom,
        elevation: 50,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer_outlined),
              label: "Doubt Support"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "Profile"),
        ],
        onTap: (currIndex) {
          setState(() {
            _indexBottom = currIndex;
          });
        },
      ),
    );
  }
}
