import 'package:acadmy/models/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../widgets/utils.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: _screenWidth * 0.05),
      child: Scaffold(
        body: Center(
          child: Form(
            key: formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "AcadMy",
                    style: GoogleFonts.getFont(
                      'Archivo',
                      fontSize: 50.0,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    "Your partner in acheiving excellence!!!",
                    style: GoogleFonts.getFont(
                      'Permanent Marker',
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  //Name Field
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      prefixIcon: Icon(Icons.email_rounded),
                      hintText: 'Full Name',
                      labelText: 'Full Name',
                      filled: true,
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (email) {
                      if (nameController.text.isEmpty) {
                        return 'This field cannot be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  //Email Field
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      prefixIcon: Icon(Icons.email_rounded),
                      hintText: 'E-mail',
                      labelText: 'E-mail',
                      filled: true,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (email) {
                      if (email!.isEmpty) {
                        return 'This field cannot be empty';
                      } else if (EmailValidator.validate(
                          emailController.text.trim())) {
                        return null;
                      }
                      return "Invalid email address";
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  //Password Field
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Password',
                      labelText: 'Password',
                      filled: true,
                    ),
                    validator: (passString) {
                      if (passString!.isEmpty) {
                        return 'Required Field cannot be empty';
                      } else if (passString.length < 4) {
                        return 'Must be a minimum of 4 characters';
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  //Confirm Password Field
                  TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Confirm Password',
                      labelText: 'Confirm Password',
                      filled: true,
                    ),
                    obscureText: true,
                    validator: (confPass) {
                      if (passwordController.text.trim() != confPass) {
                        return 'Passwords do not match';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // DropdownButton<String>(
                  //   value: dropdownValue,
                  //   icon: const Icon(Icons.arrow_downward),
                  //   elevation: 16,
                  //   style: const TextStyle(color: Colors.deepPurple),
                  //   underline: Container(
                  //     height: 2,
                  //     color: Colors.deepPurpleAccent,
                  //   ),
                  //   onChanged: (String? newValue) {
                  //     setState(() {
                  //       dropdownValue = newValue!;
                  //     });
                  //   },
                  //   items: <String>['One', 'Two', 'Free', 'Four']
                  //       .map<DropdownMenuItem<String>>((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  // ),

                  //SignUp Button
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    icon: const Icon(Icons.lock_open, size: 32),
                    label: const Text(
                      'Sign-in',
                      style: TextStyle(fontSize: 24),
                    ),
                    onPressed: signUp,
                  ),

                  //Navigation Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginPage()));
                          },
                          child: const Text("Sign In"))
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final docUser = FirebaseFirestore.instance
          .collection('users')
          .doc(emailController.text.trim().toString());
      UserProfile.email = emailController.text.trim();
      UserProfile.name = nameController.text.trim();
      UserProfile.batch = "Target SDE";
      UserProfile.picUrl =
          "https://cdn.pixabay.com/photo/2016/08/31/11/54/user-1633249_1280.png";

      final json = UserProfile.toJson();

      await docUser.set(json);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    } on Exception catch (e) {
      Utils.showSnackBar(e.toString());
    }

    Utils.showSnackBar("Account Created Successfully");
    Navigator.of(context).pop();
    //navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
