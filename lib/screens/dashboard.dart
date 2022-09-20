import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  static String routeName = '/dashboard';
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Dashboard")),
      ),
    );
  }
}
