import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:health_care/pages/ClientSection/login/signupScreen.dart';
import 'package:health_care/pages/ClientSection/mainScreens/bottomBar.dart';

import 'package:toast/toast.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var phoneHeight = MediaQuery.of(context).size.height;
    var phoneWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                height: MediaQuery.of(context).size.height / 2 / 2,
                'assets/signin.png',
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Welcome to Health Care",
                style: GoogleFonts.aBeeZee(fontSize: 23),
              ),
              const SizedBox(
                height: 30,
              ),
              login_field(
                controller: _username,
                hint_text: "Enter Your Email",
                obscuretext: false,
                hide: false,
              ),
              const SizedBox(
                height: 15,
              ),
              login_field(
                controller: _password,
                hint_text: "Enter Password",
                obscuretext: true,
                hide: true,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Passoword ?",
                      style: TextStyle(
                          color: Colors.blue,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black),
                width: MediaQuery.of(context).size.width - 80,
                height: 60,
                child: TextButton(
                  onPressed: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                        email: _username.text,
                        password: _password.text,
                      );

                      User? user = userCredential.user;
                      print('Signed in: ${user!.uid}');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomBar()));
                    } catch (e) {
                      Toast.show('Credentials Not Match');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, elevation: 7),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                width: MediaQuery.of(context).size.width - 80,
                height: 60,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ));
                  },
                  child: const Text(
                    "Create Account",
                    style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold),
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

class login_field extends StatelessWidget {
  final controller;
  final String hint_text;
  final bool obscuretext;
  final bool hide;

  const login_field(
      {super.key,
      this.controller,
      required this.hint_text,
      required this.obscuretext,
      required this.hide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          hintText: hint_text,
          suffixIcon:
              hide ? const Icon(Icons.remove_red_eye) : const SizedBox(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade700),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
        ),
        obscureText: obscuretext,
      ),
    );
  }
}
