import 'package:flutter/material.dart';

class MockTestScreen extends StatelessWidget {
  static String routeName = "/mock_test";
  const MockTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Mock Test"),
        ),
      ),
    );
    ;
  }
}
