import 'package:acadmy_app/mock_data/user_profile_data.dart';
import 'package:acadmy_app/screens/homepage.dart';
import 'package:acadmy_app/services/api_services.dart';
import 'package:acadmy_app/services/authentication.dart';
import 'package:acadmy_app/services/validation_services.dart';
import 'package:acadmy_app/widgets/utils.dart';
import 'package:flutter/material.dart';

import 'signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  //route name
  static String routeName = '/sign_up';

  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isObscure = true;
  bool _sde = false;
  bool _ukssc = false;
  bool _sbipo = false;

  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _conf_password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/register.png'),
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
                  "Welcome\nto AcadMy",
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
                        controller: _name,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          hintText: 'Name',
                          icon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _email,
                        validator: (value) =>
                            ValidationServices.validateEmail(_email.text),
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
                        controller: _password,
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
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _conf_password,
                        obscureText: true,
                        validator: (value) =>
                            ValidationServices.passwordEquality(
                                _password.text, value),
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          hintText: 'Confirm Password',
                          icon: const Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Courses",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Target SDE"),
                          Checkbox(
                            value: _sde,
                            onChanged: (value) {
                              setState(() {
                                _sde = value!;
                              });
                            },
                          ),
                          const Text("SBIO PO"),
                          Checkbox(
                            value: _sbipo,
                            onChanged: (value) {
                              setState(() {
                                _sbipo = value!;
                              });
                            },
                          ),
                          const Text("UK SSC"),
                          Checkbox(
                            value: _ukssc,
                            onChanged: (value) {
                              setState(() {
                                _ukssc = value!;
                              });
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_sde || _sbipo || _ukssc) {
                            AuthService.signUp(_email.text, _password.text);
                            List<String> courses = [];
                            if (_sde) courses.add("SDE");
                            if (_sbipo) courses.add("SBI PO");
                            if (_ukssc) courses.add("UK SSC");
                            ApiService()
                                .postNewUser(_name.text, _email.text, courses);
                            UserCoreDetails.email = _email.text;
                            Navigator.pushReplacementNamed(
                                context, HomePage.routeName);
                          } else {
                            Utils.showSnackBar("Select a courses");
                          }
                        },
                        child: const Text("Sign Up"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already Registered? "),
                          TextButton(
                              onPressed: () => {
                                    Navigator.pushReplacementNamed(
                                        context, SignInScreen.routeName)
                                  },
                              child: const Text("Sign In"))
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
