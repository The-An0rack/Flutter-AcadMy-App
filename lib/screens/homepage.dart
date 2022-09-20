import 'package:acadmy_app/screens/dashboard.dart';
import 'package:acadmy_app/screens/profile_page.dart';
import 'package:acadmy_app/screens/syllabus_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../data/device_details.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 2;
  List<Widget> pages = [Dashboard(), SyllabusPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    DeviceDetails.height = MediaQuery.of(context).size.height;
    DeviceDetails.width = MediaQuery.of(context).size.width;
    DeviceDetails.fontScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: pages[_currentPageIndex],
      bottomNavigationBar: Container(
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: GNav(
            duration: const Duration(milliseconds: 400),
            backgroundColor: Colors.grey.shade200,
            color: Colors.green,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.greenAccent.shade400,
            selectedIndex: _currentPageIndex,
            onTabChange: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            tabs: [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.book, text: 'Syllabus'),
              GButton(icon: Icons.account_circle, text: 'Profile')
            ],
          ),
        ),
      ),
    );
  }
}
