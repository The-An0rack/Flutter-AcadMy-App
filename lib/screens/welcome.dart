import 'package:acadmy_app/screens/signin_screen.dart';
import 'package:flutter/material.dart';

import '../data/device_details.dart';
import 'signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = "/";
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceDetails.height = MediaQuery.of(context).size.height;
    DeviceDetails.width = MediaQuery.of(context).size.width;
    DeviceDetails.fontScale = MediaQuery.of(context).textScaleFactor;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/logo.png',
            height: DeviceDetails.height * 0.3),
        SizedBox(
          height: DeviceDetails.height * 0.05,
        ),
        Text("AcadMy", style: Theme.of(context).textTheme.displayLarge),
        Text("One solution for all your preperation needs....",
            style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(
          height: DeviceDetails.height * 0.05,
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context)
              .pushReplacementNamed(SignInScreen.routeName),
          child: const Text("Sign In", style: TextStyle(fontSize: 30)),
        ),
        SizedBox(
          height: DeviceDetails.height * 0.02,
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context)
              .pushReplacementNamed(SignUpScreen.routeName),
          child: const Text("Sign Up", style: TextStyle(fontSize: 30)),
        )
      ],
    );
  }
}
