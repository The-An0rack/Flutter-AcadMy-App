import 'package:acadmy_app/data/device_details.dart';
import 'package:acadmy_app/mock_data/user_profile_data.dart';
import 'package:acadmy_app/screens/homepage.dart';
import 'package:acadmy_app/screens/signup_screen.dart';
import 'package:acadmy_app/services/authentication.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  //route name
  static String routeName = '/sign_in';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isObscure = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //TextEditingController email = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    DeviceDetails.height = MediaQuery.of(context).size.height;
    DeviceDetails.width = MediaQuery.of(context).size.width;
    DeviceDetails.fontScale = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 55, top: 200),
                child: const Text(
                  "Welcome\nBack",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontStyle: FontStyle.italic),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 400, horizontal: 30),
                  margin: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          hintText: 'Email',
                          icon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            hintText: 'Password',
                            icon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          AuthService.signIn(
                              emailController.text, passwordController.text);
                          Navigator.pushReplacementNamed(
                              context, HomePage.routeName);
                        },
                        child: const Text("Sign In"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Not Registered? "),
                          TextButton(
                              onPressed: () {
                                UserCoreDetails.email =
                                    emailController.text.trim();

                                Navigator.pushReplacementNamed(
                                    context, SignUpScreen.routeName);
                              },
                              child: const Text("Sign Up"))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
