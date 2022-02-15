import 'package:flutter/material.dart';

import './home_screen.dart';
import './doubt_screen.dart';
import './profile_screen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _indexBottom;
  @override
  void initState() {
    super.initState();
    _indexBottom = 0;
  }

  var tabs = [
    HomeScreen(),
    DoubtScreen(),
    ProfileScreen(),
  ];

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
