import 'package:acadmy_app/screens/dashboard.dart';
import 'package:acadmy_app/screens/profile_page.dart';
import 'package:acadmy_app/screens/syllabus_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/homepage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;
  List<Widget> pages = [const Dashboard(), SyllabusPage(), const ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              tabs: const [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(icon: Icons.book, text: 'Syllabus'),
                GButton(icon: Icons.account_circle, text: 'Profile')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
